class Hotel < ApplicationRecord
  has_many :reservations

  validates :name, :city, :number_of_rooms, :price, presence: true
  validates :name, uniqueness: true
  validates :number_of_rooms, :price, numericality: { greater_than: 0 }
end