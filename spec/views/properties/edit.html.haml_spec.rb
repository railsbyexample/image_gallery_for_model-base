require 'rails_helper'

RSpec.describe 'properties/edit', type: :view do
  before(:each) do
    @property = assign(:property, create(:property))
  end

  it 'renders the edit property form' do
    render

    assert_select 'form[action=?][method=?]', property_path(@property), 'post' do
      assert_select 'input[name=?]', 'property[title]'
      assert_select 'input[name=?]', 'property[number_of_rooms]'
      assert_select 'input[name=?]', 'property[number_of_bathrooms]'
      assert_select 'input[name=?]', 'property[size_in_square_meters]'
      assert_select 'textarea[name=?]', 'property[description]'
    end
  end
end
