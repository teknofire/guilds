import { Controller } from "@hotwired/stimulus"
import DataTable from "datatables.net-bs5"

// Connects to data-controller="datatables"
export default class extends Controller {
  static targets = ["table"]
  static values = {
    order: { type: Array, default: [0, 'asc'] }
  }

  connect() {
  }

  tableTargetConnected(element) {
    this.initializeDatatable(element)
  }

  initializeDatatable(element) {
    new DataTable(element, {
      retrieve: true,
      order: [this.orderValue]
    });
  }
}