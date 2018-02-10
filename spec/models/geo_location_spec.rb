require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  it 'has a valid factory' do
    geo_location = build :geo_location
    expect(geo_location).to be_valid
  end

  describe 'validations' do
    it 'should be invalid without a latitude' do
      geo_location = build :geo_location, latitude: nil
      expect(geo_location).to be_invalid
    end

    it 'should be invalid without a longitude' do
      geo_location = build :geo_location, longitude: nil
      expect(geo_location).to be_invalid
    end

    it 'should be invalid without a place_id' do
      geo_location = build :geo_location, place_id: nil
      expect(geo_location).to be_invalid
    end

    it 'should be invalid without a label' do
      geo_location = build :geo_location, label: nil
      expect(geo_location).to be_invalid
    end

    it 'should be invalid without address components' do
      geo_location = build :geo_location, address_components: nil
      expect(geo_location).to be_invalid
    end
  end
end
