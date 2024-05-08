/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["src/templates/**/*.ml"],
  theme: {
    extend: {},
  },
  plugins: [require("@tailwindcss/typography"), require('daisyui')],
}

