import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const themeToggleBtn = this.element;
    const themeToggleDarkIcon = this.element.querySelector("#theme-toggle-dark-icon");
    const themeToggleLightIcon = this.element.querySelector("#theme-toggle-light-icon");

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem("color-theme") === "dark" || (!("color-theme" in localStorage) && window.matchMedia("(prefers-color-scheme: dark)").matches)) {
      themeToggleLightIcon.classList.remove("hidden");
      document.documentElement.classList.add("dark");
    } else {
      themeToggleDarkIcon.classList.remove("hidden");
      document.documentElement.classList.add("light");
    }

    let event = new Event("dark-mode");

    themeToggleBtn.addEventListener("click", function () {

      // toggle icons
      themeToggleDarkIcon.classList.toggle("hidden");
      themeToggleLightIcon.classList.toggle("hidden");

      // if set via local storage previously
      if (localStorage.getItem("color-theme")) {
        if (localStorage.getItem("color-theme") === "light") {
          document.documentElement.classList.add("dark");
          localStorage.setItem("color-theme", "dark");
        } else {
          document.documentElement.classList.remove("dark");
          localStorage.setItem("color-theme", "light");
        }

        // if NOT set via local storage previously
      } else {
        if (document.documentElement.classList.contains("dark")) {
          document.documentElement.classList.remove("dark");
          localStorage.setItem("color-theme", "light");
        } else {
          document.documentElement.classList.add("dark");
          localStorage.setItem("color-theme", "dark");
        }
      }
      document.dispatchEvent(event);
    });
  }
}
