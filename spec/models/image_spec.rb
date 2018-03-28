require 'rails_helper'
require 'refile/file_double'

RSpec.describe Image, type: :model do
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
        build :image,
              attached_file: Refile::FileDouble.new('test', 'test.txt', content_type: 'text/plain')
      expect(image).to be_invalid
    end

    it 'is valid with an image file' do
      image =
        build :image,
              attached_file: Refile::FileDouble.new('test', 'test.png', content_type: 'image/png')
      expect(image).to be_valid
    end
  end

  describe 'ordering', :focus do
    let(:property) { create :property }
    let(:images) do
      5.times { create :image, owner: property }
      property.images
    end

    it 'has default order on creation' do
      expect(images.first.position).to eq(0)
      expect(images.last.position).to eq(images.count - 1)
    end

    it 'reorders images by updating positions' do
      first_image = images.first
      last_image = images.last
      last_image.update(position: 0)

      expect(last_image.reload.position).to eq(0)
      expect(first_image.reload.position).to eq(1)
    end
  end
end
