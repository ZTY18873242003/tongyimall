/**
 * Storage封装, 封装了两级，再往下存储或删除只能重新传入新对象替换
 * 这里的键名加上" ",是因为JSON.parse(字符串)参数中要传入字符串,再转成对象
 * 封装样例：
 *     Key  : Value
 *     mall ： {
 *              "user": {
 *                  "userName": "jack",
 *                  "age": 30,
 *                  "sex": 1
 *                }
 *             }
 * 使用示例：
 *  storage.setItem('user', { name: 'JerryBro' })
 *  storage.setItem('info', { height: '180cm' }, 'user')
 *  const info = storage.getItem('info', 'user')
 *  storage.clear('info', 'user')
 */
const STORAGE_KEY = 'mall'
export default {
  // 存储值,原理同下(注意看是否有moduleName,有则存储到二级,无则到一级,即键为mall的值下)
  // value(第二个参数):可以是对象,数字,字符串都行
  setItem (key, value, moduleName) {
    if (moduleName) {
      const val = this.getItem(moduleName)
      val[key] = value
      // 递归setItem()方法,即没有第三个参数,存储在键为mall的值内
      this.setItem(moduleName, val)
    } else {
      const val = this.getStorage()
      val[key] = value
      // 注意: 这里的window.sessionStorage.setItem是API自带的方法,而不是用的自己定义的方法
      window.sessionStorage.setItem(STORAGE_KEY, JSON.stringify(val))
    }
  },
  /**
   * this.getStorage()得到缓存中键为mall的对象
   * @param {*} key : this.getStorage()[key]根据键名获取对应的值
   * @param {*} moduleName : 若有第二个参数,则先获取this.getStorage()[moduleName]对象,再查找该对象下的key值
   * 功能: 若只填一个参数或填了两个参数(其中第二个参数是null或mall下不存在的键名),则相当于查找一级this.getStorage()[key]
   * 即: 获取sessionStorage键为mall的值下的键为key的内容(若有moduleName,则获取moduleName下的key内容)
   * 返回值： Object
   */
  getItem (key, moduleName) {
    if (moduleName) {
      // 这里递归了getItem(),显然进入调用的是一个参数的getItem()方法,直接返回this.getStorage()[key]对象
      const val = this.getItem(moduleName)
      if (val) return val[key]
    }
    return this.getStorage()[key]
  },
  getStorage () {
    // 若window.sessionStorage.getItem(STORAGE_KEY)为null,则JSON.parse('{}'),将字符串'{}'转成一个对象{}
    // 即下面代码意思:若缓存中键名为mall中的值为空,则返回空对象{},否则转换mall中的值为对象返回
    return JSON.parse(window.sessionStorage.getItem(STORAGE_KEY) || '{}')
  },
  clear (key, moduleName) {
    const val = this.getStorage()
    if (moduleName) {
      // 若moduleName为空,则直接返回(即什么都没做)
      if (!val[moduleName]) return
      // 若moduleName不为空,则删除该模块下的key值
      delete val[moduleName][key]
    } else {
      delete val[key]
    }
    window.sessionStorage.setItem(STORAGE_KEY, JSON.stringify(val))
  }
}
