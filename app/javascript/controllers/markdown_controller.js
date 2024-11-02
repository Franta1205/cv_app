import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Connecting markdown editor");

        // Accessing SimpleMDE from the global window object
        if (window.SimpleMDE) {
            new window.SimpleMDE({ element: this.element.querySelector("textarea") });
        } else {
            console.error("SimpleMDE is not loaded");
        }
    }
}