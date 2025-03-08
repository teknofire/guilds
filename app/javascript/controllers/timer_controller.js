import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
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
    if (this.hasDurationValue) {
      this.showRemaining(this.endTime)
    } else {
      this.showElapsed(this.startTime)
    }
  }

  showRemaining(time) {
    const now = new Date().getTime()
    const remaining = Math.floor((time - now) / 1000)
    if (remaining <= 0) {
      this.elapsedTarget.textContent = "00:00:00"
      this.showElapsed(time, true)
    } else {
      this.elapsedTarget.textContent = this.formatTime(remaining)
    }
  }

  showElapsed(time, past = false) {
    const now = new Date().getTime()
    const elapsed = Math.floor((now - time) / 1000)

    if (past) {
      this.elapsedTarget.textContent = "-" + this.formatTime(elapsed)
    } else {
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
