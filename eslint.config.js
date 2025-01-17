// @ts-check
const antfu = require('@antfu/eslint-config').default

module.exports = antfu(
  {
    ignores: [
      // eslint ignore globs here
      'test/**/*',
      'vscode/*.js',
    ],
  },
  {
    rules: {
      // overrides
      'jsonc/no-useless-escape': 'off',
    },
  },
)
