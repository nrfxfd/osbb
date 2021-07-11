class AppartmentsController < ApplicationController

  def index

    @appartments = 'appartment.all, CRUD'

  end

  def show
    @appartments = appartment.find(params[:id])
  end

  def new
    @appartments = appartment.new
  end

  def create
    @appartments = appartment.new(article_params)

    if @appartment.save
      redirect_to @appartment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appartments = appartment.find(params[:id])
  end

  def update
    @appartments = appartment.find(params[:id])

    if @appartment.update(article_params)
      redirect_to @appartment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appartments = appartment.find(params[:id])
    @appartment.destroy

    redirect_to @appartment_path
  end

  private
  def appartment_params
    params.require(:article).permit(:title, :body, :status)
  end

end