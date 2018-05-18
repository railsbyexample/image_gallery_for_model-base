require 'rails_helper'

RSpec.describe HomeController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('home#index')
    end

    it 'routes to #show' do
      expect(get: '/home').to route_to('home#show')
    end
  end
end
