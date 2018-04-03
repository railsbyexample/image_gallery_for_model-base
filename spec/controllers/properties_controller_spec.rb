require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  user = FactoryBot.create :user
  let(:property) { create :property, owner: user }
  let(:properties) { create_list :property, 3 }

  let(:valid_attributes) { attributes_for :property }
  let(:invalid_attributes) { attributes_for :property, title: nil }

  context 'when the owner is not logged in' do
    describe 'GET #index (with specific user)' do
      it 'redirects to root' do
        get :index, params: { user_id: user.to_param }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'GET #new' do
      it 'redirects to root' do
        get :new, params: { user_id: user.to_param }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'GET #edit' do
      it 'redirects to root' do
        get :edit, params: { user_id: user.to_param, id: property.to_param }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'PUT #update' do
      it 'redirects to root' do
        put :update, params: { id: property.to_param, property: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to root' do
        delete :destroy, params: { id: property.to_param }
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET #index' do
    context 'without specifying an owner' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_success
      end

      it 'sets the list of properties' do
        get :index, params: {}
        expect(assigns(:properties)).to eq(properties)
      end

      it 'renders the index template' do
        get :index, params: {}
        expect(response).to render_template(:index)
      end
    end

    context 'with a user specified as owner' do
      login_user(user)

      it 'returns a success response' do
        get :index, params: { user_id: user.to_param }
        expect(response).to be_success
      end

      it 'sets the list of properties' do
        get :index, params: { user_id: user.to_param }
        expect(assigns(:properties)).to eq(user.properties)
      end

      it 'renders the index template' do
        get :index, params: { user_id: user.to_param }
        expect(response).to render_template(:owner_index)
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: property.to_param }
      expect(response).to be_success
    end

    it 'sets the property' do
      get :show, params: { id: property.to_param }
      expect(assigns(:property)).to eq(property)
    end

    it 'renders the show template' do
      get :show, params: { id: property.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    login_user(user)

    it 'returns a success response' do
      get :new, params: { user_id: user.to_param }
      expect(response).to be_success
    end

    it 'renders the `new` template' do
      get :new, params: { user_id: user.to_param }
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    login_user(user)

    it 'returns a success response' do
      get :edit, params: { id: property.to_param }
      expect(response).to be_success
    end

    it 'renders the `edit` template' do
      get :edit, params: { id: property.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    login_user(user)

    context 'with valid params' do
      it 'creates a new Property' do
        expect do
          post :create, params: { user_id: user.to_param, property: valid_attributes }
        end.to change(Property, :count).by(1)
      end

      it 'redirects to the created property' do
        post :create, params: { user_id: user.to_param, property: valid_attributes }
        expect(response).to redirect_to(Property.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the `new` template)' do
        post :create, params: { user_id: user.to_param, property: invalid_attributes }
        expect(response).to be_success
      end
    end

    context 'with a valid nested geo_location' do
      let(:attributes_with_valid_geo_location) do
        geo_location_attributes = ActiveSupport::JSON.encode(attributes_for(:geo_location))
        attributes_for(:property).merge(geo_location_attributes: geo_location_attributes)
      end

      it 'redirects to the created property' do
        post :create,
             params: { user_id: user.to_param, property: attributes_with_valid_geo_location }
        expect(response).to redirect_to(Property.last)
      end

      it 'adds an associated geo_location to the property' do
        post :create,
             params: { user_id: user.to_param, property: attributes_with_valid_geo_location }

        geo_location = assigns(:property).geo_location
        expect(geo_location.persisted?).to be(true)
      end
    end

    context 'with an invalid nested geo_location' do
      let(:attributes_with_invalid_geo_location) do
        geo_location_attributes =
          ActiveSupport::JSON.encode(attributes_for(:geo_location, place_id: nil))

        attributes_for(:property).merge(geo_location_attributes: geo_location_attributes)
      end

      it 'returns a success response (i.e. to display the `new` template)' do
        post :create, params: { user_id: user.to_param, property: attributes_with_invalid_geo_location }
        expect(response).to be_success
      end

      it 'sets geo_location errors' do
        post :create, params: { user_id: user.to_param, property: attributes_with_invalid_geo_location }
        expect(assigns(:property).geo_location.errors.empty?).to be(false)
      end

      it 'does not create a geo_location' do
        expect do
          post :create, params: { user_id: user.to_param, property: attributes_with_invalid_geo_location }
        end.to change { GeoLocation.count }.by(0)
      end
    end

    context 'with valid features param' do
      let(:features) { %w[hello world] }

      let(:attributes_with_valid_features) do
        attributes_for(:property)
          .merge(features: ActiveSupport::JSON.encode(features))
      end

      it 'redirects to the created property' do
        post :create, params: { user_id: user.to_param, property: attributes_with_valid_features }
        expect(response).to redirect_to(Property.last)
      end

      it 'stores the features in the property' do
        post :create, params: { user_id: user.to_param, property: attributes_with_valid_features }
        expect(assigns(:property).features).to eq(features)
      end
    end
  end

  describe 'PUT #update' do
    login_user(user)

    context 'with valid params' do
      let(:new_attributes) { attributes_for :property, title: 'New Title' }

      it 'updates the requested property' do
        put :update, params: { id: property.to_param, property: new_attributes }
        property.reload
        expect(property.title).to eq('New Title')
      end

      it 'redirects to the property' do
        put :update,
            params: { id: property.to_param, property: valid_attributes }
        expect(response).to redirect_to(property)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the `edit` template)' do
        put :update,
            params: { id: property.to_param, property: invalid_attributes }
        expect(response).to be_success
      end
    end

    context 'with a nil geo_location_id' do
      it 'removes association to a geo_location' do
        geo_location = create :geo_location
        property = create :property, owner: user, geo_location: geo_location
        put :update,
            params: { id: property.to_param, property: { geo_location_id: '' } }

        property.reload
        expect(property.geo_location).to be_nil
      end
    end

    context 'with a valid nested geo_location' do
      let(:property) { create :property, owner: user }
      let(:attributes_with_valid_geo_location) do
        geo_location_attributes = ActiveSupport::JSON.encode(attributes_for(:geo_location))
        attributes_for(:property).merge(geo_location_attributes: geo_location_attributes)
      end

      it 'redirects to the property' do
        put :update,
            params: { id: property.to_param, property: attributes_with_valid_geo_location }
        expect(response).to redirect_to(Property.last)
      end

      it 'adds an associated geo_location to the property' do
        put :update,
            params: { id: property.to_param, property: attributes_with_valid_geo_location }

        geo_location = assigns(:property).geo_location
        expect(geo_location.persisted?).to be(true)
      end
    end

    context 'with an invalid nested geo_location' do
      let(:attributes_with_invalid_geo_location) do
        geo_location_attributes =
          ActiveSupport::JSON.encode(attributes_for(:geo_location, place_id: nil))

        attributes_for(:property).merge(geo_location_attributes: geo_location_attributes)
      end

      it 'returns a success response (i.e. to display the `edit` template)' do
        put :update,
            params: { id: property.to_param, property: attributes_with_invalid_geo_location }
        expect(response).to be_success
      end

      it 'renders the `edit` template' do
        put :update,
            params: { id: property.to_param, property: attributes_with_invalid_geo_location }
        expect(response).to render_template(:edit)
      end

      it 'sets geo_location errors' do
        put :update,
            params: { id: property.to_param, property: attributes_with_invalid_geo_location }
        expect(assigns(:property).geo_location.errors.empty?).to be(false)
      end

      it 'does not create a geo_location' do
        expect do
          put :update,
              params: { id: property.to_param, property: attributes_with_invalid_geo_location }
        end.to change { GeoLocation.count }.by(0)
      end
    end

    context 'with valid features param' do
      let(:features) { %w[hello world] }
      let(:attributes_with_valid_features) do
        attributes_for(:property)
          .merge(features: ActiveSupport::JSON.encode(features))
      end

      it 'redirects to the created property' do
        post :update, params: { id: property.to_param, property: attributes_with_valid_features }
        expect(response).to redirect_to(Property.last)
      end

      it 'stores the features in the property' do
        post :update, params: { id: property.to_param, property: attributes_with_valid_features }
        expect(assigns(:property).features).to eq(features)
      end
    end
  end

  describe 'DELETE #destroy' do
    login_user(user)

    it 'destroys the requested property' do
      property = create :property, owner: user
      expect do
        delete :destroy, params: { id: property.to_param }
      end.to change(Property, :count).by(-1)
    end

    it 'redirects to the properties list' do
      property = create :property, owner: user
      delete :destroy, params: { id: property.to_param }
      expect(response).to redirect_to(properties_url)
    end
  end
end
