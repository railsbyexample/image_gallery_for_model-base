require 'rails_helper'
require "refile/file_double"

RSpec.describe Image, :focus, type: :model do
  it 'has a valid factory' do
    image = create :image
    expect(image).to be_valid
  end

  describe 'validations' do
    it 'is invalid without an attached_file' do
      image = build :image, attached_file: nil
      expect(image).to be_invalid
    end

    it 'is invalid with a non image file' do
      image =
        build :image, attached_file: Refile::FileDouble.new('test', 'test.txt', content_type: 'text/plain')
      expect(image).to be_invalid
    end

    it 'is valid with an image file' do
      image =
        build :image, attached_file: Refile::FileDouble.new('test', 'test.png', content_type: 'image/png')
      expect(image).to be_valid
    end
  end
end
