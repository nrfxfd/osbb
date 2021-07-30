class LoginController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
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

  private

  def apartment_params
    params.require(:apartment).permit( :apartment_number, :apartment_area,
                                       :heating_counter,
                                       :water_counter,:electricity_counter,:arrears)
  end

end
