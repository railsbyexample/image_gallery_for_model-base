class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :number_of_rooms
      t.string :number_of_bathrooms
      t.float :size_in_square_meters
      t.text :description

      t.timestamps
    end
  end
end
