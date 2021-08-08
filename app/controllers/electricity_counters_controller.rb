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
   @electricity_counter = @apartment.electricity_counters.new
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
      redirect_to apartment_path @apartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @apartment = Apartment.find(params[:apartment_id])
    @electricity_counter = @apartment.electricity_counters.find(params[:id])
    @electricity_counter.destroy
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
