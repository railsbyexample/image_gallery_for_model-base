require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:property) { create :property }
  let(:images) { create_list :image, 3, owner: property }

  let(:invalid_attributes) { attributes_for :image, attached_file: nil }
  let(:valid_attributes) do
    attributes_for :image,
                   attached_file: fixture_file_upload('files/attached_file.png', 'image/png'),
                   owner: property
  end

  let(:params) do
    { property_id: property.id }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: params
      expect(response).to be_success
    end

    it 'sets the list of images' do
      get :index, params: params
      expect(assigns(:owner)).to eq(property)
    end

    it 'sets an image for the form' do
      get :index, params: params
      expect(assigns(:image).owner).to eq(property)
    end

    it 'renders the index template' do
      get :index, params: params
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:params) do
        {
          property_id: property.id,
          image: valid_attributes
        }
      end

      it 'creates a new Image' do
        expect do
          post :create, params: params
        end.to change(Image, :count).by(1)
      end

      it 'redirects to the images index' do
        post :create, params: params
        expect(response).to redirect_to(property_images_path(property))
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          property_id: property.id,
          image: invalid_attributes
        }
      end

      it 'redirects to the images index' do
        post :create, params: params
        expect(response).to redirect_to(property_images_path(property))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested image' do
      image = create :image, owner: property
      expect do
        delete :destroy, params: params.merge(id: image.id)
      end.to change(Image, :count).by(-1)
    end

    it 'redirects to the images list' do
      image = create :image, owner: property
      delete :destroy, params: params.merge(id: image.id)
      expect(response).to redirect_to(property_images_path(property))
    end
  end
end
