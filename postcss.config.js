const postcss = require('postcss');
const postcssHasPseudo = require('css-has-pseudo');
module.exports = (ctx) => ({
  map: ctx.options.map,
  parser: ctx.options.parser,
  plugins: [
    postcssHasPseudo({preserve: false})
  ]
});
