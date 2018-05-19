json.extract! property,
              :id, :title, :price_per_month, :number_of_rooms, :number_of_bathrooms,
              :size_in_square_feet, :description, :created_at, :updated_at
json.url property_url(property, format: :json)
