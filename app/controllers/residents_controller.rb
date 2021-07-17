class ResidentsController < ApplicationController

  def show
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.find(params[:id])
  end

  def new
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.new
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.create(resident_params)
    redirect_to apartment_path @apartment
  end

  def edit
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.find(params[:id])

    if @resident.update(resident_params )
      redirect_to apartment_path @apartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.find(params[:id])
    @resident.destroy
    redirect_to apartment_path @apartment

  end

  private
  def resident_params
    params.require(:resident).permit( :apartment_number, :lastname, :name,
                                      :surname, :phone, :birthday, :owner, :tenant, :apartment_id)
  end

end
