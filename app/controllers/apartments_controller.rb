class ApartmentsController < ApplicationController

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
      redirect_to apartment_path @apartment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update(apartment_params )
      redirect_to apartment_path @apartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit( :apartment_number, :apartment_area,
                                       :heating_counter,
                                       :water_counter,:electricity_counter,:arrears,
                                       :user, :password_digest)
  end

end
