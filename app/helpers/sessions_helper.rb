module SessionsHelper

  #Logs in user(apartment)
  def log_in(apartment)
    session[:apartment_id] = apartment.id
  end

  #Remember the user(apartment) in a permanent session
  def remember(apartment)
    apartment.remember
    cookies.permanent.signed[:apartment_id] = apartment.id
    cookies.permanent[:remember_token] = apartment.remember_token
  end

  #Returns the user corresponding to the remember token in the cookie
  def current_apartment
    if (apartment_id = session[:apartment_id])
      @current_apartment ||= Apartment.find_by(id: apartment_id)
    elsif (apartment_id = cookies.signed[:apartment_id])
      apartment = Apartment.find_by(id: apartment_id)
      if apartment && apartment.authenticated?(cookies[:remember_token])
        log_in apartment
        @current_apartment = apartment
      end
    end
  end

  #Returns true if the user is logged in, otherwise false
  def logged_in?
    !current_apartment.nil?
  end

  #Forgets the constant session
  def forget(apartment)
    apartment.forget
    cookies.delete(:apartment_id)
    cookies.delete(:remember_token)
  end

  #Logs out the current user
  def log_out
    forget(current_apartment)
    session.delete(:apartment_id)
    @current_apartment = nil
  end
end
