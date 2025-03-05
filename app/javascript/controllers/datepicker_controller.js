import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("datepicker connected");
    // console.log(Datepicker);
  }

  inputTargetConnected(element) {
    console.log('picker connected');
    // console.log(Datepicker);
    this.initializePicker(element);
  }

  initializePicker(element) {
    new flatpickr(element, {
      enableTime: true,
      dateFormat: "Y-m-d h:i K",
      // altInput: true,
      // altFormat: "F j, Y H:i",
    });
  }

}
