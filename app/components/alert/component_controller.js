// Reconnect ActionCable after switching accounts

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.remove()
  }

  remove(event = null) {
    let timeout = 5000;
    if (event) timeout = parseInt(event.target.getAttribute("data-timer"));
    setTimeout(() => {
      this.element.classList.add("transition", "ease-in-out", "duration-300", "transform", "translate-x-full", "opacity-0")
    }, timeout - 500)
    setTimeout(() => {
      this.element.remove()
    }, timeout)
  }
}
