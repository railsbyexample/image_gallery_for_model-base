class ImagesController < ApplicationController
  before_action :set_owner
  before_action :set_image, only: %i[destroy]

  # GET /images
  def index
    @image = images.new
  end

  # POST /images
  def create
    @image = images.create(image_params)
    debugger
    respond_with @image, location: images_path
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    respond_with @image, location: images_path
  end

  private

  def set_owner
    @owner = Property.find(params[:property_id]) if params[:property_id]
  end

  def images_path
    send("#{@owner.class.name.underscore}_images_path".to_sym, @owner) if @owner.present?
  end

  def images
    @owner.present? ? @owner.images : Image
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:attached_file)
  end
end
