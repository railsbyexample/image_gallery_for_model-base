require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property) { create :property }
  let(:properties) { create_list :property, 3 }
  let(:valid_attributes) { attributes_for :property }
  let(:invalid_attributes) { attributes_for :property, title: nil }

  describe 'GET #index' do
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
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end

    it 'renders the new template' do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: property.to_param }
      expect(response).to be_success
    end

    it 'returns a success response' do
      get :edit, params: { id: property.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Property' do
        expect do
          post :create, params: { property: valid_attributes }
        end.to change(Property, :count).by(1)
      end

      it 'redirects to the created property' do
        post :create, params: { property: valid_attributes }
        expect(response).to redirect_to(Property.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the `new` template)' do
        post :create, params: { property: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :property, title: 'New Title' }

      it 'updates the requested property' do
        put :update, params: { id: property.to_param, property: new_attributes }
        property.reload
        expect(property.title).to eq('New Title')
      end

      it 'redirects to the property' do
        put :update, params: { id: property.to_param, property: valid_attributes }
        expect(response).to redirect_to(property)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the `edit` template)' do
        property = Property.create! valid_attributes
        put :update, params: { id: property.to_param, property: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested property' do
      property = create :property
      expect do
        delete :destroy, params: { id: property.to_param }
      end.to change(Property, :count).by(-1)
    end

    it 'redirects to the properties list' do
      property = create :property
      delete :destroy, params: { id: property.to_param }
      expect(response).to redirect_to(properties_url)
    end
  end

end
