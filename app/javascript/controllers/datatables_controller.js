import { Controller } from "@hotwired/stimulus"
import jqueryDataTables from "datatables"

// Connects to data-controller="datatables"
export default class extends Controller {
  static targets = ["table"]

  connect() {
    console.log('datatables connected')
  }

  tableTargetConnected(element) {
    console.log('connected: ', element)
    let table = new DataTables(element)
  }
}