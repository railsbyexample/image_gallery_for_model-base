import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'autocomplete',
    'geoLocationInput',
    'geoLocationIdInput'
  ];

  connect() {
    // Initialize Google Place autocomplete on label input
    this.autocomplete = new google.maps.places.Autocomplete(this.autocompleteTarget);
    // Add listener to react to place change
    this.autocomplete.addListener('place_changed', () => { this.updateModel(this.autocomplete.getPlace()) });
    // Allow enter to select suggestion on Google Place autocomplete
    google.maps.event.addDomListener(this.autocompleteTarget, 'keydown', this.allowSelectOnEnter);
  }

  updateModel = (place) => {
    let geoLocation = null

    if (place.place_id) {
      geoLocation = {
        label: place.label,
        place_id: place.place_id,
        latitude: place.geometry.location.lat(),
        longitude: place.geometry.location.lng(),
        address_components: place.address_components
      }
    }

    this.geoLocationInputTarget.value = JSON.stringify(geoLocation)
  }

  clearIfEmpty = (event) => {
    if (!event.target.value) {
      this.geoLocationIdInputTarget.value = null;
      this.geoLocationInputTarget.value = JSON.stringify(null);
    }
  }

  allowSelectOnEnter = event => {
    if (event.keyCode == 13 && $('.pac-container:visible').length) {
      event.preventDefault();
    }
  }
}
