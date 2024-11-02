import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connecting")
    this.element.textContent = "Hello World!"
  }
}
