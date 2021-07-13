class ResidentsController < ApplicationController
  def index

    @residents = Resident.all

  end
  def show
    @resident = Resident.find(params[:id])
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)

    if @resident.save
      redirect_to @resident
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])

    if @resident = Resident.update(article_params)
      redirect_to @resident
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy

    redirect_to @resident_path
  end

  private
  def appartment_params
    params.require(:resident).permit
  end

end
