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
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to hotels_path
    else
      render :new
    end
  end

  private

  def prefill_data
    @hotel_id = params[:hotel_id]
    @arrival_date = params[:arrival_date]
    @depature_date = params[:depature_date]
    @number_of_rooms = params[:number_of_rooms]
  end

  def reservation_params
    params.require(:reservation).permit(
      :first_name,
      :last_name,
      :phone,
      :email,
      :hotel_id,
      :arrival_date,
      :depature_date,
      :number_of_rooms
    )
  end
end
