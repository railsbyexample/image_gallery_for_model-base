shared_examples_for 'geo_locatable' do
  let(:model) { described_class } # the class that includes the concern

  it 'should create a new geo location if it doesn\'t exist' do
    # Create a location (without storing it)
    geo_location = build :geo_location

    # Create the record with the location attributes
    geo_locatable = create(
      model.to_s.underscore.to_sym,
      geo_location_attributes: geo_location.attributes
    )

    # Verify the location gets created and added to the record
    expect(GeoLocation
      .where(place_id: geo_location.place_id).length).to be 1
    expect(geo_locatable.geo_location_id).to be_truthy
  end

  it 'should reuse the geo location if it already exists' do
    # Create a geo location (without storing it)
    geo_location = build :geo_location
    geo_location_attributes = geo_location.attributes

    # Save the geo location and create the geo_locatable model with the same
    # location attributes
    geo_location.save
    geo_locatable = create(
      model.to_s.underscore.to_sym,
      geo_location_attributes: geo_location_attributes
    )

    # Verify the location gets created and added to the geo_locatable model
    expect(GeoLocation
      .where(place_id: geo_location.place_id).length).to be 1
    expect(geo_locatable.geo_location_id).to be_truthy
  end
end
