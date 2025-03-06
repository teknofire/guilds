import { Controller } from "@hotwired/stimulus"
import AirDatepicker from "air-datepicker"
import localeEn from 'air-datepicker/locale/en'

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
    new AirDatepicker(element, {
      timepicker: true,
      timeFormat: "hh:mm",
      dateFormat: "yyyy-MM-dd",
      buttons: ['today'],
      locale: localeEn
    });
  }

}
