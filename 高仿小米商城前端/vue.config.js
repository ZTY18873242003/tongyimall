// 给webpack打包编译用的、具体看官方文档vue-cli的参考配置
// 注意:这里的配置只是本地启动node服务器才有效,若部署到服务器上,要重新配置nginx才有效
module.exports = {
  pwa: {
    iconPaths: {
      favicon32: 'icon.svg',
      favicon16: 'icon.svg',
      appleTouchIcon: 'icon.svg',
      maskIcon: 'icon.svg',
      msTileImage: 'icon.svg'
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
