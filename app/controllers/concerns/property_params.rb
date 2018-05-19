##
# Global application helpers
module PropertyParams
  def property_params
    transformed_params.require(:property).permit(
      :title, :price_per_month, :number_of_rooms, :number_of_bathrooms,
      :size_in_square_feet, :description, { features: [] },
      :geo_location_id,
      geo_location_attributes: [
        :place_id, :label, :latitude, :longitude, :_destroy,
        address_components: [:long_name, :short_name, types: []]
      ]
    )
  end

  def transformed_params
    transformed_params = params.dup

    transformed_params = transform_property_json(transformed_params, :features)
    transformed_params = transform_property_json(transformed_params, :geo_location_attributes)

    transformed_params
  end

  def transform_property_json(params, attribute)
    transformed_params = params

    if params.dig(:property, attribute)
      transformed_params[:property][attribute] = JSON.parse(params[:property][attribute])
    end

    transformed_params
  end
end
