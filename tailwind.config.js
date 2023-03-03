/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/views/**/*.{html,html.erb,erb}",
    "./app/javascript/**/*.js",
    "./app/components/**/*.{html,html.erb,erb,.js,.rb}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
