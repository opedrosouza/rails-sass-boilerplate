import { Drawer } from "flowbite";
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  constructor() {
    super(...arguments);
    this.drawer = new Drawer(this.element);
  }

  connect() {
    this.drawer.show();
  }

  hide() {
    this.drawer.hide();
    this.drawer.destroy();
  }

}
