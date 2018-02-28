##
# REST controller for the Property model
class PropertiesController < ApplicationController
  include PropertyParams
  before_action :set_property, only: %i[show edit update destroy]

  # GET /properties
  def index
    @properties = Property.all
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
    @property = Property.create(property_params)
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

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end
end
