##
# Defines the model for listed properties
class Property < ApplicationRecord
  validates :title, presence: true
  validates :number_of_rooms, numericality: { integer: true }, allow_blank: true
  validates :number_of_bathrooms, format: { with: /(\A\d+\.5\z)?/ }, allow_blank: true

  monetize :price_per_month_cents, allow_nil: true

  # GeoLocation concern
  belongs_to :geo_location, optional: true
  accepts_nested_attributes_for :geo_location

  ##
  # Overwrite geo_location autosave to reuse existing
  def autosave_associated_records_for_geo_location
    # Return if no geo_location is being set
    return unless geo_location

    # Try to find an existing GeoLocation
    existing_geo_location = GeoLocation.find_by(place_id: geo_location.place_id)

    if existing_geo_location
      # If it exists, associate the existing record
      self.geo_location = existing_geo_location
    else
      # Otherwise save it and associate it
      geo_location.save!
      self.geo_location = geo_location
    end
  end
end
