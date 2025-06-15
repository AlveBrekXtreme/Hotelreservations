class Administrators::HotelsController < ApplicationController
  before_action :find_hotel, only: [ :edit, :update, :destroy ]

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to administrators_hotels_path
    else
      render :new
    end
  end


  def update
    if @hotel.update(hotel_params)
      redirect_to administrators_hotels_path
    else
      render :edit
    end
  end

  def destroy
    if @hotel.destroy
      render turbo_stream: turbo_stream.destroy(dom_id(@hotel))
    else
      head :unprocessable_entity
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(
      :name,
      :city,
      :number_of_rooms,
      :price
    )
  end

  def find_hotel
    @hotel = Hotel.find(params[:id])
  end
end
