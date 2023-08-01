import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hint"]

  submitStart(event) {
    this.hintTarget.textContent = "Saving ..."

    for (var element of event.target.elements) {
      element.setAttribute("disabled", "")
    }
  }

  submitEnd() {
    this.hintTarget.textContent = "Saved."
  }

  beforeRender(event) {
    event.preventDefault()
    setTimeout(() => { event.detail.resume() }, 1000)
  }
}
