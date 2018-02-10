##
# Stores Google Place addresses
class GeoLocation < ApplicationRecord
  has_many :stores

  validates :label, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true, uniqueness: true
  validates :address_components, presence: true
end
