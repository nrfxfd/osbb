class ResidentsController < ApplicationController

  before_action :admin_apartment, only: [:index, :create, :new, :destroy]

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

    if @resident.update(resident_params)
      flash[:success] = "Дані оновлено"
      redirect_to apartment_path @apartment
    else
      flash[:danger] = "Будь-ласка, спробуйте ще "
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    @apartment = Apartment.find(params[:apartment_id])
    @resident = @apartment.residents.find(params[:id])
    @resident.destroy
    flash[:success] = "Видалено"
    redirect_to apartment_path @apartment

  end

  def admin_apartment
    redirect_to(login_url) unless current_apartment.admin?
  end

  private
  def resident_params
    params.require(:resident).permit( :apartment_number, :lastname, :name,
                                      :surname, :phone, :birthday, :owner, :tenant,
                                      :apartment_id)
  end

end
