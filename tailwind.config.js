/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./views/**/*.php",
    "./widgets/**/*.php",
    "./assets/AppAsset.php", // In case you register JS files that might add classes
    "./web/js/**/*.js",     // For any JavaScript files that might manipulate classes
  ],
  important: true, // Added this line to make utilities !important
  theme: {
    extend: {
      fontFamily: {
        // Assuming 'Source Sans Pro' is the primary font from AdminLTE
        // and we want to keep it for now for consistency.
        sans: ['"Source Sans Pro"', ...require('tailwindcss/defaultTheme').fontFamily.sans],
      },
    },
  },
  plugins: [],
}
