import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "counter"]
  static values = { max: Number }

  connect() {
    this.updateCounter()
  }

  updateCounter() {
    const length = this.inputTarget.value.length
    const remaining = this.maxValue - length
    this.counterTarget.textContent = `${remaining} characters remaining`
  }

  input() {
    this.updateCounter()
  }
}