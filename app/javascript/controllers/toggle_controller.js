import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-toggle"
export default class extends Controller {
  static targets = ["filterBox"]

  connect() {
    console.log("Check checking checkers")
  }

  showFilter() {
    console.log("Verify Verifying Verifiers")
    this.filterBoxTarget.classList.toggle("d-none");
  }
}
