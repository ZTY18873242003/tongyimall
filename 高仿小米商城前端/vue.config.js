// 给webpack打包编译用的、具体看官方文档vue-cli的参考配置
// 注意:这里的配置只是本地启动node服务器才有效,若部署到服务器上,要重新配置nginx才有效
module.exports = {
  // 公共路径(必须有的)
  publicPath: "./",
  // 输出文件目录
  outputDir: "dist",
  // 静态资源存放的文件夹(相对于ouputDir)
  assetsDir: "public",
  // eslint-loader 是否在保存的时候检查(果断不用，这玩意儿我都没装)
  // 我用的only，打包后小些

  pwa: {
    iconPaths: {
      favicon32: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon.svg',
      favicon16: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon.svg',
      appleTouchIcon: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon.svg',
      maskIcon: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon.svg',
      msTileImage: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon.svg'
    }
  },
  lintOnSave: false, //如果为false，就是取消eslint规则的检查
  devServer: {
    host: 'localhost',
    port: 8080,
  },

  productionSourceMap: false, // 设为false：打包后部署在Sources中搜索不到main.js(即看不到源码)，更安全
  chainWebpack: (config) => { // 删除预加载，防止重复加载
    config.plugins.delete('prefetch')
  }
}
