import { Controller } from "@hotwired/stimulus"
import Tagify from "@yaireo/tagify"

// Connects to data-controller="tag"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log('connected, test')
  }

  inputTargetConnected(element) {
    this.initializeSelect(element);
  }

  inputTargetDisconnected(element) {
  }

  initializeSelect(element) {
    console.log("tag connected");
    new Tagify(element, {
      allowNew: true,
      delimiters: ',',
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
    })
  }
}
