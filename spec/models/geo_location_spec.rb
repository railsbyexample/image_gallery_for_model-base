require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  it 'has a valid factory' do
    geo_location = build :geo_location
    expect(geo_location).to be_valid
  end

  describe 'validations' do
    it 'prevents creation of duplicates' do
      geo_location1 = create :geo_location, place_id: 'some_id'
      geo_location2 = create :geo_location, place_id: 'some_id'
      expect(geo_location1).to eq(geo_location2)
    end

    it 'is invalid without a latitude' do
      geo_location = build :geo_location, latitude: nil
      expect(geo_location).to be_invalid
    end

    it 'is invalid without a longitude' do
      geo_location = build :geo_location, longitude: nil
      expect(geo_location).to be_invalid
    end

    it 'is invalid without a place_id' do
      geo_location = build :geo_location, place_id: nil
      expect(geo_location).to be_invalid
    end

    it 'is invalid without a label' do
      geo_location = build :geo_location, label: nil
      expect(geo_location).to be_invalid
    end

    it 'is invalid without address components' do
      geo_location = build :geo_location, address_components: nil
      expect(geo_location).to be_invalid
    end
  end
end
