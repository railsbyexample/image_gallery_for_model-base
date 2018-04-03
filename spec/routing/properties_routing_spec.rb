require 'rails_helper'

RSpec.describe PropertiesController, type: :routing do
  describe 'public routing' do
    it 'routes to #index' do
      expect(get: '/properties').to route_to('properties#index')
    end

    it 'routes to #show' do
      expect(get: '/properties/1').to route_to('properties#show', id: '1')
    end
  end

  describe 'private routing' do
    describe 'shallow routes' do
      it 'routes to #edit' do
        expect(get: '/properties/1/edit').to route_to('properties#edit', id: '1')
      end

      it 'routes to #update via PUT' do
        expect(put: '/properties/1').to route_to('properties#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/properties/1').to route_to('properties#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/properties/1').to route_to('properties#destroy', id: '1')
      end
    end

    describe 'nested routes' do
      it 'routes to #index' do
        expect(get: '/users/1/properties').to route_to('properties#index', user_id: '1')
      end

      it 'routes to #new' do
        expect(get: '/users/1/properties/new').to route_to('properties#new', user_id: '1')
      end

      it 'routes to #create' do
        expect(post: '/users/1/properties').to route_to('properties#create', user_id: '1')
      end
    end
  end
end
