class CreateHotels < ActiveRecord::Migration[8.0]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.integer :number_of_rooms, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
