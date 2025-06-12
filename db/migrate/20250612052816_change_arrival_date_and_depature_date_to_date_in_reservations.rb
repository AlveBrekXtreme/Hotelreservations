class ChangeArrivalDateAndDepatureDateToDateInReservations < ActiveRecord::Migration[8.0]
  def change
    change_column :reservations, :arrival_date, :date
    change_column :reservations, :depature_date, :date
  end
end
