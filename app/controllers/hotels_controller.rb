class HotelsController < ApplicationController
  before_action :set_search_params, only: :search

  def index
  end

  def search
  end

  private

  def search_params
    params.require(:search)
            .permit(:city, :arrival_date, :depature_date, :number_of_rooms, :max_price)
  end

  def set_search_params
    @city = search_params[:city]
    @arrival_date = search_params[:arrival_date]
    @depature_date = search_params[:depature_date]
    @number_of_rooms = search_params[:number_of_rooms]
    @max_price = search_params[:max_price]
  end
end
