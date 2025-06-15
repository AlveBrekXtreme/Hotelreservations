class ReservationController < ApplicationController
  before_action :prefill_data, only: :new

  def new
    @reservation = Reservation.new(
      hotel_id: @hotel_id,
      arrival_date: @arrival_date,
      depature_date: @depature_date,
      number_of_rooms: @number_of_rooms
    )
  end

  def create
  end

  private

  def prefill_data
    @hotel_id = params[:hotel_id]
    @arrival_date = params[:arrival_date]
    @depature_date = params[:depature_date]
    @number_of_rooms = params[:number_of_rooms]
  end
end
