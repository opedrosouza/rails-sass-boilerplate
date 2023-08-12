import { Controller } from "@hotwired/stimulus";
import { Drawer } from "flowbite";

export default class extends Controller {
  constructor(...args) {
    super(...args);
    this.drawer = new Drawer(this.element);
  }

  connect() {
    this.drawer.show();
  }

  hide() {
    this.drawer.hide();
  }
}
