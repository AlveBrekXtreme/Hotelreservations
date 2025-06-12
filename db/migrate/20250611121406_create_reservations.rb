class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.references :hotel, null: false, foreign_key: true
      t.datetime :arrival_date, null: false
      t.datetime :depature_date, null: false
      t.integer :number_of_rooms, null: false
      t.timestamps
    end
  end
end
