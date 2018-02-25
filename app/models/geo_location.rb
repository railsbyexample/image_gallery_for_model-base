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
  # Parse address_components if given as string
  # [TODO] do this automatically
  before_validation :parse_address_components_json

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

  ##
  # Parses the address_components to a hash if passed in as a string
  def parse_address_components_json
    return unless address_components.try(:is_a, String)
    self.address_components = JSON.parse(address_components)
  end
end
