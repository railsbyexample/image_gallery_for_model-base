require 'rails_helper'

RSpec.describe 'images/index', type: :view do
  before(:each) do
    property = create :property
    create_list :image, 3, owner: property
    assign(:owner, property)
    assign(:image, build(:image, owner: property))
  end

  it 'renders a list of images' do
    render
  end
end
