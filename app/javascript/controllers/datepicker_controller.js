import { Controller } from "@hotwired/stimulus"
import AirDatepicker from "air-datepicker"
import localeEn from 'air-datepicker/locale/en'

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("datepicker connected");
  }

  click(event) {
    console.log("datepicker clicked");
    this.inputTarget.showPicker()
  }
}
