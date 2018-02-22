##
# Migration to link properties with google locations
class AddGeoLocationToProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :geo_location, foreign_key: true
  end
end
