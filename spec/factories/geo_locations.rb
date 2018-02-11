FactoryBot.define do
  factory :geo_location do
    label 'MyString'
    sequence(:place_id, &:to_s)
    latitude 1.5
    longitude 1.5
    address_components '[{ "name": "New York" }]'
  end
end
