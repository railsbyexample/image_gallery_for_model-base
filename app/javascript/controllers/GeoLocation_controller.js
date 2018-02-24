import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'autocomplete',
    'placeId',
    'label',
    'latitude',
    'longitude',
    'addressComponents'
  ];

  connect() {
    this.autocomplete = new google.maps.places.Autocomplete(this.autocompleteTarget);
    this.autocomplete.addListener('place_changed', () => { this.change() })
  }

  change() {
    this.populateModel(this.autocomplete.getPlace());
  }

  populateModel(place) {
    this.placeIdTarget.value = place.place_id;
    this.labelTarget.value = place.formatted_address;
    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
    this.addressComponentsTarget.value = JSON.stringify(place.address_components);
  }
}
