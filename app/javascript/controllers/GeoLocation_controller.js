import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'autocomplete',
    'placeId',
    'latitude',
    'longitude',
    'addressComponents'
  ];

  connect() {
    // Initialize Google Place autocomplete on label input
    this.autocomplete = new google.maps.places.Autocomplete(this.autocompleteTarget);
    // Add listener to react to place change
    this.autocomplete.addListener('place_changed', () => { this.change() })
    // Allow enter to select suggestion on Google Place autocomplete
    google.maps.event.addDomListener(this.autocompleteTarget, 'keydown', event => {
      if (event.keyCode == 13 && $('.pac-container:visible').length) {
        event.preventDefault();
      }
    });
  }

  change() {
    this.populateModel(this.autocomplete.getPlace());
  }

  populateModel(place) {
    this.placeIdTarget.value = place.place_id;
    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
    this.addressComponentsTarget.value = JSON.stringify(place.address_components);
  }
}
