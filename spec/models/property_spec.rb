require 'rails_helper'

RSpec.describe Property, type: :model do
  it 'has a valid factory' do
    property = create :property
    expect(property).to be_valid
  end

  describe 'validations' do
    it 'is invalid without a title' do
      property = build :property, title: ''
      expect(property).to be_invalid
    end

    it 'is invalid with a non numeric number of rooms' do
      property = build :property, number_of_rooms: 'three'
      expect(property).to be_invalid
    end

    describe 'number_of_bathrooms', :focus do
      it 'is valid if divisible by .5' do
        property = build :property, number_of_bathrooms: 3.5
        expect(property).to be_valid
      end

      it 'is valid if blank' do
        property = build :property, number_of_bathrooms: ''
        expect(property).to be_valid
      end

      it 'is invalid if not divisible by .5' do
        property = build :property, number_of_bathrooms: '3.7'
        expect(property).to be_invalid
      end

      it 'is invalid with a non numeric value' do
        property = build :property, number_of_bathrooms: 'three'
        expect(property).to be_invalid
      end
    end

    describe 'price_per_month' do
      it 'is valid with a numeric usd amount' do
        property = build :property, price_per_month: '100'
        expect(property).to be_valid
      end

      it 'is invalid with a currency other than usd' do
        property = build :property, price_per_month: '100 eur'
        expect(property).to be_invalid
      end
    end
  end
end
