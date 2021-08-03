class SessionsController < ApplicationController
  def new
  end

  def create
    apartment = Apartment.find_by(apartment_number: params[:session][:apartment_number])
    if apartment && apartment.authenticate(params[:session][:password])
      log_in apartment
      remember apartment
      params[:session][:remember_me] == '1' ? remember(apartment) : forget(apartment)
      redirect_to apartment
    else
      flash.now[:danger] = 'хибна комбінація:    №квартири/пароль'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to home_path
  end
end