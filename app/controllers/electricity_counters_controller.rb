class ElectricityCountersController < ApplicationController
  before_action :admin_apartment, only: [:index, :create, :new, :destroy]

  def index
    @electricity_counters=ElectricityCounter.all
  end

  def show
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.find(params[:id])
  end

  def new
   @apartment = Apartment.find(params[:apartment_id])
   if @apartment.electricity_counters.exists?
     flash[:danger] = "Ця дія заборонена"
     redirect_to apartment_path @apartment
   else
    @electricity_counter = @apartment.electricity_counters.new
   end
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.create(electricity_counter_params)
    redirect_to apartment_path @apartment
  end

  def edit
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.find(params[:id])

    if @electricity_counter.update(electricity_counter_params)
      if current_apartment != @apartment
        redirect_to apartments_path
        flash[:success] = "Дані оновлено"
      else
        redirect_to apartment_path @apartment
        flash[:success] = "Дані оновлено"
      end
    else
      flash[:danger] = "Будь-ласка, спробуйте ще "
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.find(params[:id])
    @electricity_counter.destroy
    flash[:success] = "Видалено"
    redirect_to apartment_path @apartment

  end

  def admin_apartment
    redirect_to(login_url) unless current_apartment.admin?
  end

  private
  def electricity_counter_params
    params.require(:electricity_counter).permit( :value,
                                      :apartment_id)
  end

end
