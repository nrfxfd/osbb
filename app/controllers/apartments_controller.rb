class ApartmentsController < ApplicationController

  before_action :logged_in_apartment
  before_action :correct_apartment, only: [:show,:edit, :update]
  before_action :admin_apartment, only: [:index, :create, :new, :destroy]

  def index

    @apartments = Apartment.all

  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      flash[:success] = "Welcome to the New Apartment!"
      redirect_to apartment_path @apartment
    else
      flash.now[:danger] = "Пароль обовя'зково (не менше 4-х символів)"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update(apartment_params)
      flash[:success] = "Дані оновлено"
      redirect_to apartment_path @apartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    flash[:success] = "Видалено"
    @apartment.destroy

    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit( :apartment_number, :apartment_area,
                                       :heating_counter, :water_counter,
                                       :electricity_counter,:arrears, :password,
                                       :password_confirmation)
  end

  #Prefilters
  # verified login
  def logged_in_apartment
    unless logged_in?
      flash[:danger] = "Будь-ласка, авторизуйтесь"
      redirect_to login_url
    end
  end

  #verified correct login
  def correct_apartment
    @apartment = Apartment.find(params[:id])
    redirect_to(login_url) unless @apartment == @current_apartment || current_apartment.admin?
  end

  def admin_apartment
    redirect_to(login_url) unless current_apartment.admin?
  end

end
