##
# REST controller for the Property model
class PropertiesController < ApplicationController
  include PropertyParams
  before_action :set_owner
  before_action :set_property, only: %i[show edit update destroy]

  # GET /properties
  def index
    @properties = properties.all
    render :owner_index if @owner
  end

  # GET /properties/1
  def show; end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties
  def create
    @property = properties.create(property_params)
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
