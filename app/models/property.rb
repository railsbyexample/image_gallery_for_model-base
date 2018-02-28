##
# Defines the model for listed properties
class Property < ApplicationRecord
  validates :title, presence: true
  validates :number_of_rooms, numericality: { integer: true }, allow_blank: true
  validates :number_of_bathrooms, format: { with: /\A\d+\.5\z/ }, allow_blank: true

  monetize :price_per_month_cents, allow_nil: true

  # GeoLocation
  belongs_to :geo_location, optional: true
  accepts_nested_attributes_for :geo_location

  # Images
  has_many :images, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :images
end
