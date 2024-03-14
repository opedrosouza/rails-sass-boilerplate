import { Controller } from "@hotwired/stimulus";
import { Modal } from "flowbite";

export default class extends Controller {
  constructor() {
    super(...arguments);
    this.modal = new Modal(this.element);
    this.destroyMissingBackDrop();
  }

  connect() {
    this.modal.show();
  }

  hide() {
    if (this.element.hasAttribute("src")) this.element.removeAttribute("src");
    this.modal.hide();
    this.modal.destroy();
  }

  // used for form submission as turbo:submit-end->modal--component#submitEnd
  submitEnd(e) {
    if (e.detail.success) {
      this.hide();
    }
  }

  destroyMissingBackDrop() {
    document.querySelector("[modal-backdrop]")?.remove();
  }

}
