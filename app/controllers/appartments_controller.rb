class AppartmentsController < ApplicationController

  def index

    @appartments = Appartment.all

  end

  def show
    @appartment = Appartment.find(params[:id])
  end

  def new
    @appartment = Appartment.new
  end

  def create
    @appartment = Appartment.new(appartment_params)

    if @appartment.save
      redirect_to @appartment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appartment = Appartment.find(params[:id])
  end

  def update
    @appartment = Appartment.find(params[:id])

    if @appartment.update(article_params)
      redirect_to @appartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appartment = Appartment.find(params[:id])
    @appartment.destroy

    redirect_to @appartment_path
  end

  private
  def appartment_params
    params.require(:appartment).permit(:apprtmnt, :arears, :status)
  end

end