require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'with a user logged in' do
      user = FactoryBot.create :user
      login_user(user)

      it "redirects to the user's dashboard" do
        get :index
        expect(response).to redirect_to(user_properties_url(user))
      end
    end

    context 'without a user logged in' do
      it 'redirects to home' do
        get :index
        expect(response).to redirect_to(home_url)
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show
      expect(response).to be_success
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template(:show)
    end
  end
end
