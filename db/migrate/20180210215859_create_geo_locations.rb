##
# Creates table for stored google places locations
class CreateGeoLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_locations do |t|
      t.string :label
      t.string :place_id

      t.float :latitude
      t.float :longitude

      t.json :address_components

      t.timestamps
    end

    add_index :geo_locations, %i[latitude longitude]
  end
end
