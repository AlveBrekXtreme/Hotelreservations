class Reservation < ApplicationRecord
  belongs_to :hotel

  validates :first_name, :last_name, :phone, :email, :arrival_date, :depature_date, :number_of_rooms, presence: true
  validates :phone, length: { is: 8 }
  validates :arrival_date, comparison: { less_than: :depature_date }
  validates :number_of_rooms, numericality: { greater_than: 0 }
end