import { Controller } from "@hotwired/stimulus";
import "./component.css";

export default class extends Controller {

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

}
