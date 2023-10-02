const grunt = require("grunt");
const postcssHasPseudo = require("css-has-pseudo");

grunt.loadNpmTasks("grunt-postcss");

grunt.initConfig({
  postcss: {
    options: {
      processors: [
        (_opts = {}) => {
          return postcssHasPseudo({
            selectors: ["*"],
          });
        },
      ],
    },
    dist: {
      src: "foundation/css/default.shim.css",
      dest: "foundation/css/default.css",
    },
  },
});

grunt.registerTask("default", ["postcss"]);
