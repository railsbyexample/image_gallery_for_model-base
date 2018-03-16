require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/properties/1/images').to route_to('images#index', property_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/properties/1/images').to route_to('images#create', property_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/images/1').to route_to('images#destroy', id: '1')
    end
  end
end
