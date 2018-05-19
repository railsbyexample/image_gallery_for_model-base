##
# Creates the table for the Property model
class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title

      t.integer :number_of_rooms
      t.string :number_of_bathrooms
      t.float :size_in_square_feet

      t.text :description

      t.timestamps
    end

    add_index :properties, :title
    add_monetize :properties, :price_per_month, amount: { null: true, default: nil }
  end
end
