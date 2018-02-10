##
# Defines the model for listed properties
class Property < ApplicationRecord
  validates :title, presence: true
  validates :number_of_rooms, numericality: { integer: true }, allow_nil: true
  validates :number_of_bathrooms, format: { with: /\A\d+\.5\z/ }, allow_nil: true

  monetize :price_per_month_cents, allow_nil: true
end
