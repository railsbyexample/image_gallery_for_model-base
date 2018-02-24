import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'existingFeatures',
    'newFeature'
  ];

  connect() {
    this.existingFeatures = [].slice.call(this.existingFeaturesTarget.getElementsByTagName('input'))
    .map(el => el.value)
  }

  addNewFeature = () => {
    console.log(this.newFeatureTarget.value);
    console.log(this.existingFeatures);
  }
}
