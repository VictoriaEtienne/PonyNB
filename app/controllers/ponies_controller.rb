class PoniesController < ApplicationController
  def index
    @ponies = Pony.all
  end

  def show
    @pony = Pony.find(params[:id])
    @booking = Booking.new
    @marker =
    [{
      lat: @pony.latitude,
      lng: @pony.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {pony: @pony}),
      marker_html: render_to_string(partial: "marker")
    }]
  end

  def new
    @pony = Pony.new
  end

  def create
    @pony = Pony.new(pony_params)
    @pony.user = current_user
    if @pony.save
      redirect_to ponies_path
    else
      render :new
    end
  end

  def pony_params
    params.require(:pony).permit(:name, :description, :price, :sex, :color, :discipline, :breed, :address, :photo)
  end
end
