/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["src/templates/**/*.ml"],
  theme: {
    extend: {},
  },
  daisyui: {
    themes: ["light", "dark", "emerald"],
  },
  plugins: [require("@tailwindcss/typography"), require('daisyui')],
}

