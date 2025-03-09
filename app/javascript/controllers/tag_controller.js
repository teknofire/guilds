import { Controller } from "@hotwired/stimulus"
import Tagify from "@yaireo/tagify"

// Connects to data-controller="tag"
export default class extends Controller {
  static targets = ["input"]

  connect() {
  }

  inputTargetConnected(element) {
    this.initializeSelect(element);
  }

  inputTargetDisconnected(element) {
  }

  initializeSelect(element) {
    new Tagify(element, {
      allowNew: true,
      delimiters: ',',
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
    })
  }
}
