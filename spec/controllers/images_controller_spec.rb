require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  user = FactoryBot.create :user
  let(:property) { create :property, owner: user }
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

  context 'when the owner is not logged in' do
    describe 'GET #index (with specific user)' do
      it 'redirects to root' do
        get :index, params: { property_id: property.to_param }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'POST #create' do
      it 'redirects to root' do
        post :create, params: { property_id: property.to_param, image: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to root' do
        delete :destroy, params: { id: images.first.to_param }
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET #index' do
    login_user(user)

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
      expect(assigns(:image)).to be_a(Image)
    end

    it 'renders the index template' do
      get :index, params: params
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    login_user(user)

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
    login_user(user)

    it 'destroys the requested image' do
      image = create :image, owner: property
      expect do
        delete :destroy, params: params.merge(id: image.id)
      end.to change(Image, :count).by(-1)
    end

    it 'redirects to the images index' do
      image = create :image, owner: property
      delete :destroy, params: params.merge(id: image.id)
      expect(response).to redirect_to(property_images_path(property))
    end
  end
end
