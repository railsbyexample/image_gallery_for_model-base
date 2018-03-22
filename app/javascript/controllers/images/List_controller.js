import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'list'
  ];

  moveUp = ({ target }) => {
    target = (target.tagName == 'BUTTON') ? target : target.closest('button');
    const element = this.listTarget.querySelector(`#image${target.dataset.id}`);
    const previousElement = element.previousElementSibling;

    if (previousElement) {
      this.listTarget.insertBefore(element, previousElement);
    }
  };

  moveDown = ({ target }) => {
    target = (target.tagName == 'BUTTON') ? target : target.closest('button');
    const element = this.listTarget.querySelector(`#image${target.dataset.id}`);
    const nextElement = element.nextElementSibling;

    if (nextElement) {
      this.listTarget.insertBefore(element, nextElement.nextElementSibling);
    }
  };
}
