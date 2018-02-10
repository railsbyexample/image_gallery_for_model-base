class Property < ApplicationRecord
  validates :title, presence: true
  monetize :price_per_month_cents
end
