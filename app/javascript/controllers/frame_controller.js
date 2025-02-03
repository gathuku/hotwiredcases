import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    reloadInterval: 1000,
  };

  connect() {
    // setInterval(() => { this.element.reload() }, this.reloadIntervalValue)
    let a = 0;

    this.intervalId = setInterval(() => {
      if (a >= 10) {
        clearInterval(this.intervalId);
      } else {
        this.element.reload();
        a++;
      }
    }, 1000);
  }
}
