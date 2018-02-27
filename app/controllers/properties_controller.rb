##
# REST controller for the Property model
class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  MESSAGES = {
    created: 'Property was successfully created.',
    updated: 'Property was successfully updated.',
    destroyed: 'Property was successfully destroyed.'
  }.freeze

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show; end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: MESSAGES[:created] }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: MESSAGES[:updated] }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: MESSAGES[:destroyed] }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Never trust parameters from the scary internet
  def property_params
    transformed_params.require(:property).permit(
      :title, :price_per_month, :number_of_rooms, :number_of_bathrooms,
      :size_in_square_meters, :description, { features: [] },
      geo_location_attributes: %i[place_id label latitude longitude address_components]
    )
  end

  def transformed_params
    transformed_params = params.dup

    if params.dig(:property, :features)
      transformed_params[:property][:features] = JSON.parse(params[:property][:features])
    end

    transformed_params
  end
end
