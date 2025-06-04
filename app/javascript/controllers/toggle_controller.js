import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-toggle"
export default class extends Controller {
  static targets = [
    "filterBox",
    "caret",
  ]

  connect() {
    console.log("Check checking checkers")
  }

  showFilter() {
    console.log("Verify Verifying Verifiers")
    this.filterBoxTarget.classList.toggle("d-none");
    if (this.caretTarget.children[0].classList.contains("fa-caret-right")) {
      this.caretTarget.innerHTML = `<i class="caret-btn btn btn-white fa-solid fa-caret-down" data-action="click->toggle#showFilter"></i>`;
    } else {
      this.caretTarget.innerHTML = `<i class="btn btn-white fa-solid fa-caret-right" data-action="click->toggle#showFilter"></i>`;
    }
  }
}
