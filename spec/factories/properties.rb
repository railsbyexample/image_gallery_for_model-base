FactoryBot.define do
  factory :property do
    title 'MyString'
    number_of_rooms 1
    number_of_bathrooms 1.5
    size_in_square_meters 65
    description 'MyText'
  end
end
