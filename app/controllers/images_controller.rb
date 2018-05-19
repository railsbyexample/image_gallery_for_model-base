##
# REST controller for images
class ImagesController < ApplicationController
  before_action :set_owner
  load_and_authorize_resource :image, only: %i[destroy update]

  # GET /images
  def index
    @image = Image.new
    authorize! :update, @owner
  end

  # POST /images
  def create
    @image = images.new(image_params)

    authorize! :create, @image
    if @image.save
      respond_with @image, location: images_path(@owner)
    else
      redirect_to images_path(@owner), alert: @image.errors.full_messages.first
    end
  end

  # PUT /images/1
  def update
    @image.update(image_params)
    respond_with @image
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    respond_with @image, location: images_path(@image.owner)
  end

  private

  def set_owner
    @owner = Property.find(params[:property_id]) if params[:property_id]
  end

  def images_path(owner)
    send("#{owner.class.name.underscore}_images_path".to_sym, owner) if owner.present?
  end

  def images
    @owner.present? ? @owner.images : Image
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:attached_file, :position)
  end
end
