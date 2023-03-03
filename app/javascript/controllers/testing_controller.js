import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="testing"
export default class extends Controller {
  connect() {
    console.log("testing")
  }
}
