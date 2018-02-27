require 'json'

##
# Stores Google Place addresses
class GeoLocation < ApplicationRecord
  has_many :stores

  validates :label, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true, uniqueness: true
  validates :address_components, presence: true

  # Check if the location is already stored and load it to prevent duplicate place_ids
  before_validation :load_existing

  private

  ##
  # Loads an existing record into the instance if place_id matches
  def load_existing
    # Check if record with given place_id exists
    existing_geo_location = GeoLocation.find_by(place_id: place_id)
    return unless existing_geo_location

    # Self assign existing record id
    (self.id = existing_geo_location.id) && reload
  end
end
