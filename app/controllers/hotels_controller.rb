class HotelsController < ApplicationController
  before_action :set_search_params, only: :search

  def index
    @cities = Hotel.pluck(:city).uniq
  end

  def search
    hotels = Hotel.available_hotels_in_date_range(@arrival_date..@depature_date, @number_of_rooms)
    hotels = hotels.by_city(@city)
    hotels = hotels.by_max_price(@max_price) if @max_price.present?
    search_results(
      hotels,
      {
        arrival_date: @arrival_date,
        depature_date: @depature_date,
        number_of_rooms: @number_of_rooms
      }
    )
  end

  private

  def search_params
    params.require(:search)
            .permit(:city, :arrival_date, :depature_date, :number_of_rooms, :max_price)
  end

  def set_search_params
    @city = search_params[:city]
    @arrival_date = search_params[:arrival_date]&.to_date
    @depature_date = search_params[:depature_date]&.to_date
    @number_of_rooms = search_params[:number_of_rooms].to_i
    @max_price = search_params[:max_price]
  end

  def search_results(hotels, prefilled_data)
    render turbo_stream: turbo_stream.replace(
      "hotels",
      partial: "available_hotels",
      locals: { hotels: hotels, prefilled_data: prefilled_data }
    )
  end
end
