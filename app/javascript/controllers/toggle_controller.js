import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-toggle"
export default class extends Controller {
  static targets = ["filterBox"]

  connect() {
    console.log("Check checking checkers")
  }

  switch() {
    this.filterBox.classList.toggle("d-none");
  }
}
