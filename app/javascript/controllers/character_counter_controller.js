import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "counter"]
  static values = { max: Number }

  connect() {
    console.log("CharacterCounterController connected")
    console.log("Max value:", this.maxValue)
    this.updateCounter()
  }

  updateCounter() {
    console.log("updated counter")
    const length = this.inputTarget.value.length
    const remaining = this.maxValue - length
    console.log("Characters remaining:", remaining);
    this.counterTarget.textContent = `${remaining} characters remaining`
  }

  input() {
    console.log("Input event triggered")
    this.updateCounter()
  }
}