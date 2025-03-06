import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="localtime"
export default class extends Controller {
  static targets = ["elapsed", "output"]
  static values = { time: String, duration: Number }

  connect() {
    this.intervalId = setInterval(() => {
      this.updateTimes()
    }, 1000)

    this.startTime = new Date(this.timeValue)
    this.endTime = this.startTime.getTime() + this.durationValue * 1000;
    this.updateTimes();

    const options = {
      timeZoneName: "short",
      hour: "numeric",
      minute: "numeric",
      second: "numeric",
      weekday: "long",
      year: "numeric",
      month: "numeric",
      day: "numeric",
    }
    this.outputTarget.textContent = this.startTime.toLocaleString("en-US", options)
  }

  disconnect() {
    clearInterval(this.intervalId)
  }

  updateTimes() {
    const now = new Date().getTime()
    if (this.hasDurationValue) {
      const remaining = Math.floor((this.endTime - now) / 1000)
      if (remaining <= 0) {
        this.elapsedTarget.textContent = "00:00:00"
        clearInterval(this.intervalId)
      }
      this.elapsedTarget.textContent = this.formatTime(remaining)
    } else {
      const elapsed = Math.floor((now - this.startTime) / 1000)
      this.elapsedTarget.textContent = this.formatTime(elapsed)
    }
  }

  formatTime(seconds) {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;
    return `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(secs).padStart(2, "0")}`;
  }
}
