# require 'rails_helper'
#
# RSpec.describe 'properties/index', type: :view do
#   before(:each) do
#     @properties = assign(:properties, create_list(:property, 4))
#   end
#
#   it 'renders a list of properties' do
#     render
#     assert_select 'tr>td', :text => 'Title'.to_s, :count => 2
#     assert_select 'tr>td', :text => ''.to_s, :count => 2
#     assert_select 'tr>td', :text => 2.to_s, :count => 2
#     assert_select 'tr>td', :text => 3.5.to_s, :count => 2
#     assert_select 'tr>td', :text => 4.5.to_s, :count => 2
#     assert_select 'tr>td', :text => 'MyText'.to_s, :count => 2
#   end
# end
