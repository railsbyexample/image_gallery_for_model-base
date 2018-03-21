import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'list'
  ];

  // connect = () => {
  //   debugger
  // }

  moveUp = ({ target }) => {
    const button = target.closest('button');
    const element = this.listTarget.querySelector(`#image${button.dataset.id}`);
    const previousElement = element.previousSibling;

    if (previousElement) {
      this.listTarget.insertBefore(element, previousElement);
    }
  }
}
