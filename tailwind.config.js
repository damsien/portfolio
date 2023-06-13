/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./public/**/*.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily: {
        'roboto': ['"Roboto Mono"', 'sans-serif'],
        // 'dm': ['"DM sans"', 'sans-serif'],
        // 'karla': ['Karla', 'sans-serif'],
        'space': ['"Space Mono"', 'monospace']
      },
      screens: {
        '2mm': '350px',
        'mm': '410px',
        'xs': '550px',
        '3xl': '1600px',
        '4xl': '1700px',
        '5xl': '1800px',
        '6xl': '2200px',
      },
      fontSize: {
        '2xl': ['1.5rem', '2.5rem'],
        '3xl': ['1.875rem', '3rem'],
        '10xl': ['10rem', '1'],
        '11xl': ['12rem', '1'],
        '12xl': ['14rem', '1'],
      }
    },
  },
  plugins: [],
  darkMode: 'class'
}