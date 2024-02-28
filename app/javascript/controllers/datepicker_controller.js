
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput', 'rangeInput']

  connect() {
    console.log("hey")
    this.datepicker = flatpickr(this.rangeInputTarget, {
        mode: "range",
        minDate: "today",
        onChange: (selectedDates, dateStr, instance) => {
          if (selectedDates.length == 2) {
            const startDate = selectedDates[0]
            const endDate = selectedDates[1]
            this.startDateInputTarget.value = startDate
            this.endDateInputTarget.value = endDate
          }
        }
      }
    )
  }

  disconnect() {
    console.log("disconnecting")
    this.datepicker.destroy()
  }
}
