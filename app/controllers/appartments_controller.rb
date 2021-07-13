class AppartmentsController < ApplicationController

  def index

    @appartments = Appartment.all

  end

  def show
    @appartments = Appartment.find(params[:id])
  end

  def new
    @appartments = Appartment.new
  end

  def create
    @appartments = Appartment.new(appartment_params)

    if @appartment.save
      redirect_to @appartment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appartments = Appartment.find(params[:id])
  end

  def update
    @appartments = Appartment.find(params[:id])

    if @appartment.update(article_params)
      redirect_to @appartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appartments = Appartment.find(params[:id])
    @appartment.destroy

    redirect_to @appartment_path
  end

  private
  def appartment_params
    params.require(:appartment).permit(:title, :body, :status)
  end

end