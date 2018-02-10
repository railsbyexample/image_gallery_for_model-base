FactoryBot.define do
  factory :geo_location do
    label 'MyString'
    place_id 'MyString'
    latitude 1.5
    longitude 1.5
    address_components '[{ "name": "New York" }]'
  end
end
