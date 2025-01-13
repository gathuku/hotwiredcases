import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    reloadInterval: 1000
  }

  connect() {
    setInterval(() => { this.element.reload() }, this.reloadIntervalValue)
  }
}
