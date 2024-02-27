class PoniesController < ApplicationController
  def index
    @ponies = Pony.all
  end

  def show
    @pony = Pony.find(params[:id])
  end

  def new
    @pony = Pony.new
  end

  def create
    @pony = Pony.new(pony_params)
    @pony.user = current_user
    if @pony.save
      redirect_to ponies_path(@pony)
    else
      render :new
    end
  end

  def pony_params
    params.require(:pony).permit(:name, :description, :price, :sex, :color, :discipline, :type)
  end
end
