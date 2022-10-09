/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./_layouts/**/*.html", "./*.html"],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}
