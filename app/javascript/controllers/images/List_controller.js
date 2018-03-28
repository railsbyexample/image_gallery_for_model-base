import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    'list'
  ];

  updateImage = (id, newPosition) => {
    const url = `/images/${id}.json`
    const data = {
      image: { position: newPosition }
    };

    return fetch(url, {
      body: JSON.stringify(data),
      headers: { 'content-type': 'application/json' },
      method: 'PUT'
    })
  }

  moveUp = ({ target }) => {
    target = (target.tagName == 'BUTTON') ? target : target.closest('button');
    const { id, position } = target.dataset;

    this.updateImage(id, position - 1)
    .then(() => {
      const element = this.listTarget.querySelector(`#image${target.dataset.id}`);
      const previousElement = element.previousElementSibling;

      if (previousElement) {
        this.listTarget.insertBefore(element, previousElement);
      }
    });
  };

  moveDown = ({ target }) => {
    target = (target.tagName == 'BUTTON') ? target : target.closest('button');
    const { id, position } = target.dataset;

    this.updateImage(id, position - 1)
    .then(() => {
      const element = this.listTarget.querySelector(`#image${target.dataset.id}`);
      const nextElement = element.nextElementSibling;

      if (nextElement) {
        this.listTarget.insertBefore(element, nextElement.nextElementSibling);
      }
    });
  };
}
