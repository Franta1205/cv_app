import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("connecting login controller")
    }

    static targets = ["dialog"]

    show() {
        this.dialogTarget.classList.remove("hidden");
    }

    hide() {
        this.dialogTarget.classList.add("hidden");
    }
}