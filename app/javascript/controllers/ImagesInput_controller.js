import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'imagePreview',
    'imagesInput',
    'imagesPreview'
  ];

  readUrl = ({ target }) => {
    if (target.files && target.files[0]) {
      const reader = new FileReader();

      reader.onload = (e) => {
        this.renderPreview(e.target.result);
      }

      reader.readAsDataURL(target.files[0]);
    }
  }

  renderPreview = (newUrl) => {
    const imageTag = this.imagePreviewTarget.content.querySelector('img#image-preview');
    imageTag.src = newUrl;

    const newPreview = document.importNode(this.imagePreviewTarget.content, true);
    this.imagesPreviewTarget.appendChild(newPreview);
  }
}
