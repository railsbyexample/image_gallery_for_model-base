require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe 'GET /images' do
    it 'works! (now write some real specs)' do
      skip('Not yet implemented')
      get images_path
      expect(response).to have_http_status(200)
    end
  end
end
