/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: ["./_layouts/**/*.html", "./_includes/**/*.html", "./*.html"],
  theme: {
    extend: {
      fontFamily: {
        serif: [
          '"Merriweather"',
          '"Book Antiqua"',
          "Georgia",
          '"Century Schoolbook"',
          "serif",
          ...defaultTheme.fontFamily.serif,
        ],
        sans: ['"Lato"', "sans-serif", ...defaultTheme.fontFamily.sans],
        mono: [
          '"Inconsolata"',
          "Menlo",
          "Courier",
          "monospace",
          ...defaultTheme.fontFamily.mono,
        ],
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
    function ({ addVariant }) {
      addVariant("scrollbar", "&::-webkit-scrollbar");
      addVariant("scrollbar-track", "&::-webkit-scrollbar-track");
      addVariant("scrollbar-thumb", "&::-webkit-scrollbar-thumb");
    },
  ],
};
