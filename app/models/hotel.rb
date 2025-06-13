class Hotel < ApplicationRecord
  has_many :reservations

  validates :name, :city, :number_of_rooms, :price, presence: true
  validates :name, uniqueness: true
  validates :number_of_rooms, :price, numericality: { greater_than: 0 }

  def self.available_hotels_in_date_range(reservation_period, number_of_reserved_rooms)
    reserved_rooms_per_hotel = reserved_rooms_per_hotel_in_date_range(reservation_period)
    hotel_ids = available_hotel_ids(reserved_rooms_per_hotel, number_of_reserved_rooms)
    Hotel.where(id: hotel_ids).order(:price)
  end

  private

  def self.reserved_rooms_per_hotel_in_date_range(date_range)
    Reservation
      .group(:hotel_id)
      .joins(:hotel)
      .where("arrival_date IN (:range) OR depature_date IN (:range)", range: date_range)
      .sum(:number_of_rooms)
  end

  def self.available_hotel_ids(reserved_rooms_per_hotel, number_of_reserved_rooms)
    Hotel.all.map do |hotel|
      hotel.id if hotel.number_of_rooms >= reserved_rooms_per_hotel[hotel.id] + number_of_reserved_rooms
    end
  end
end
