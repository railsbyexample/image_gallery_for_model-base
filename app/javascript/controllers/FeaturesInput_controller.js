import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'featuresInput',
    'existingFeatures',
    'newFeature'
  ];

  connect = () => {
    this.updateList();
  }

  updateList = () => {
    this.existingFeatures = [].slice.call(this.existingFeaturesTarget.getElementsByTagName('input'))
    .map(el => el.value);

    this.featuresInputTarget.value = JSON.stringify(this.existingFeatures);
  }

  addIfEnter = (event) => {
    if (event.keyCode == 13 && event.target.value) {
      event.preventDefault();
      this.addNewFeature();
    }
  }

  // Add feature to existing
  addNewFeature = () => {
    // Add input to list
    const addedFeatureInput = this.createFeatureInput(this.newFeatureTarget.value, this.existingFeaturesTarget.children.length);
    this.existingFeaturesTarget.appendChild(addedFeatureInput);

    // Update list
    this.updateList()

    // Clear `new` input
    this.newFeatureTarget.value = '';
  }

  // Remove feature from existing
  removeExistingFeature = (event) => {
    // Remove input from list
    const removedFeatureInput = document.getElementById(event.target.dataset.target);
    this.existingFeaturesTarget.removeChild(removedFeatureInput);

    // Update list
    this.updateList()
  }

  // Create feature input from template (probably can be simplified with templating)
  createFeatureInput = (value, index) => {
    const template = document.getElementById('featureTemplate');
    const inputGroup = template.content.querySelector('.input-group');
    const input = template.content.querySelector('.form-control');
    const button = template.content.querySelector('.btn');

    inputGroup.id = `feature${index}`;
    input.value = value;
    button.dataset.target = `feature${index}`;

    return document.importNode(template.content, true);
  }
}
