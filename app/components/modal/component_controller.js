import { Controller } from "@hotwired/stimulus";
import { Modal } from "flowbite";

export default class extends Controller {
  constructor() {
    super(...arguments);
    this.element.addEventListener("turbo:load", this.connect.bind(this));
    this.element.addEventListener("turbo:visit", this.hide.bind(this));
    this.modal = new Modal(this.element);
  }
  connect() {
    this.modal.show();
  }

  hide() {
    this.modal.hide();
  }
}
