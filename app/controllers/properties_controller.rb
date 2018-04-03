##
# REST controller for the Property model
class PropertiesController < ApplicationController
  include PropertyParams
  before_action :set_owner
  load_and_authorize_resource :property, except: %i[create index]

  # GET /properties
  def index
    @properties = properties.all
    return if @owner.blank?

    authorize! :update, (@properties.any? ? @properties.first : properties.new)
    render :owner_index
  end

  # GET /properties/1
  def show; end

  # GET /properties/new
  def new
    authenticate_user!
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties
  def create
    @property = properties.create(property_params)

    authorize! :create, @property
    respond_with(@property)
  end

  # PATCH/PUT /properties/1
  def update
    @property.update(property_params)
    respond_with(@property)
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    respond_with(@property)
  end

  private

  def set_owner
    @owner = User.find(params[:user_id]) if params[:user_id]
  end

  def properties
    @owner.present? ? @owner.properties : Property
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
