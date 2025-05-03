import { defineConfig } from "vite";
import FullReload from "vite-plugin-full-reload";
import RubyPlugin from "vite-plugin-ruby";
import StimulusHMR from "vite-plugin-stimulus-hmr";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  clearScreen: false,
  plugins: [
    tailwindcss({
      content: [
        "./app/views/**/*.html.erb",
        "./app/helpers/**/*.rb",
        "./app/frontend/**/*.js",
        "./app/frontend/**/*.css",
      ],
    }),
    RubyPlugin(),
    StimulusHMR(),
    FullReload(
      [
        "config/routes.rb",
        "app/views/**/*",
        "app/controllers/**/*",
        "app/helpers/**/*",
      ],
      { delay: 300 }
    ),
  ],
});
