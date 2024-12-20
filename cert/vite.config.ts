import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    https: {
      key: './cert/h5-standard-key.pem',
      cert: './cert/h5-standard.pem',
    },
    cors: {
      origin: '*',
      methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
      preflightContinue: false,
      optionsSuccessStatus: 204,
    },
    proxy: {},
  },
  // plugins: [
  //   Vue(),

  //   // https://github.com/hannoeru/vite-plugin-pages
  //   Pages(),

  //   // https://github.com/antfu/unplugin-auto-import
  //   AutoImport({
  //     imports: ['vue', 'vue-router', '@vueuse/core'],
  //     resolvers: [VantResolver()],
  //     dts: true,
  //   }),

  //   // https://github.com/antfu/vite-plugin-components
  //   Components({
  //     resolvers: [VantResolver()],
  //     dts: true,
  //   }),

  //   // https://github.com/antfu/unocss
  //   // see unocss.config.ts for config
  // ],

  // // https://github.com/vitest-dev/vitest
  // test: {
  //   environment: 'jsdom',
  // },
})
