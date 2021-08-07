<template>
  <div class="order-confirm">
    <order-header title="订单确认">
      <template v-slot:tip>
        <span>请认真填写收货地址</span>
      </template>
    </order-header>

    <!-- 用svg来替换图片的请求，性能优化 -->
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="position: absolute; width: 0px; height: 0px; overflow: hidden;">
      <defs>
        <symbol id="icon-add" viewBox="0 0 31 32">
          <title>add</title>
          <path d="M30.745 15.152h-14.382v-14.596c0-0.308-0.243-0.557-0.543-0.557s-0.543 0.249-0.543 0.557v14.596h-14.665c-0.3 0-0.543 0.249-0.543 0.557s0.243 0.557 0.543 0.557h14.665v15.177c0 0.307 0.243 0.557 0.543 0.557s0.543-0.249 0.543-0.557v-15.177h14.382c0.3 0 0.543-0.249 0.543-0.557s-0.243-0.557-0.543-0.557z" class="path1"></path>
        </symbol>
        <symbol id="icon-edit" viewBox="0 0 32 32">
          <title>edit</title>
          <path d="M28.287 8.51l-4.805-4.806 0.831-0.831c0.472-0.472 1.086-0.777 1.564-0.777 0.248 0 0.452 0.082 0.622 0.253l3.143 3.144c0.539 0.54 0.133 1.529-0.524 2.186l-0.831 0.831zM26.805 9.992l-1.138 1.138-4.805-4.806 1.138-1.138 4.805 4.806zM24.186 12.612l-14.758 14.762-4.805-4.806 14.758-14.762 4.805 4.806zM7.379 28.288l-4.892 1.224 1.223-4.894 3.669 3.67zM31.123 4.011l-3.143-3.144c-0.567-0.567-1.294-0.867-2.103-0.867-1.036 0-2.174 0.52-3.045 1.391l-20.429 20.436c-0.135 0.134-0.23 0.302-0.276 0.487l-2.095 8.385c-0.089 0.355 0.017 0.736 0.276 0.995 0.198 0.198 0.461 0.307 0.741 0.307 0.085 0 0.171-0.010 0.254-0.031l8.381-2.096c0.185-0.047 0.354-0.142 0.487-0.276l20.43-20.436c1.409-1.41 2.042-3.632 0.524-5.15v0z" class="path1"></path>
        </symbol>
        <symbol id="icon-del" viewBox="0 0 32 32">
          <title>delete</title>
          <path d="M11.355 4.129v-2.065h9.29v2.065h-9.29zM6.194 29.935v-23.742h19.613v23.742h-19.613zM30.968 4.129h-8.258v-3.097c0-0.569-0.463-1.032-1.032-1.032h-11.355c-0.569 0-1.032 0.463-1.032 1.032v3.097h-8.258c-0.569 0-1.032 0.463-1.032 1.032s0.463 1.032 1.032 1.032h3.097v24.774c0 0.569 0.463 1.032 1.032 1.032h21.677c0.569 0 1.032-0.463 1.032-1.032v-24.774h3.097c0.569 0 1.032-0.463 1.032-1.032s-0.463-1.032-1.032-1.032v0z" class="path1"></path>
          <path d="M10.323 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z" class="path2"></path>
          <path d="M16 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z" class="path3"></path>
          <path d="M21.677 9.806c-0.569 0-1.032 0.463-1.032 1.032v14.452c0 0.569 0.463 1.032 1.032 1.032s1.032-0.463 1.032-1.032v-14.452c0-0.569-0.463-1.032-1.032-1.032z" class="path4"></path>
        </symbol>
      </defs>
    </svg>
    <div class="wrapper">
      <div class="container">
        <div class="order-box">
          <div class="item-address">
            <h2 class="addr-title">收货地址</h2>
            <div class="addr-list clearfix">
              <div class="addr-info" :class="{'checked':index === checkIndex}" @click="checkIndex=index" v-for="(item,index) in list" :key="index">
                <h2>收货人:{{item.receiverName}}</h2>
                <div class="phone">联系电话:{{item.receiverMobile}}</div>
                <div class="street">地址:{{item.receiverProvince + ' ' + item.receiverCity + ' '  + ' ' + item.receiverAddress}}</div>
                <div class="action">
                  <!-- 删除地址图片 -->
                  <a href="javascript:;" class="fl" @click="delAddress(item)">
                    <svg class="icon icon-del">
                      <!-- 使用上面定义的svg矢量图 -->
                      <use xlink:href="#icon-del"></use>
                    </svg>
                  </a>
                  <!-- 编辑地址图片 -->
                  <a href="javascript:;" class="fr" @click="editAddressModal(item)">
                    <svg class="icon icon-edit">
                      <use xlink:href="#icon-edit"></use>
                    </svg>
                  </a>
                </div>
              </div>
              <div class="addr-add" @click="openAddressModal">
                <div class="icon-add"></div>
                <div>添加新地址</div>
              </div>
            </div>
          </div>
          <div class="item-good">
            <h2>商品</h2>
            <ul>
              <li v-for="(item,index) in cartList" :key="index">
                <div class="good-name">
<!--                  <img v-lazy="item.productMainImage" alt="">-->
                  <span>{{item.goods_name + '(' + item.subtitle + ')'}}</span>
                </div>
                <div class="good-price">{{item.price}}元x{{item.count}}</div>
                <div class="good-total">{{item.productTotalPrice}}元</div>
              </li>
            </ul>
          </div>
          <div class="item-shipping">
            <h2>配送方式</h2>
            <span>包邮</span>
          </div>
          <div class="item-invoice">
            <h2>发票</h2>
            <a href="javascript:;">电子发票</a>
            <a href="javascript:;">个人</a>
          </div>
          <div class="detail">
            <div class="item">
              <span class="item-name">商品件数：</span>
              <span class="item-val">{{count}}件</span>
            </div>
            <div class="item">
              <span class="item-name">商品总价：</span>
              <span class="item-val">{{cartTotalPrice}}元</span>
            </div>
            <div class="item">
              <span class="item-name">优惠活动：</span>
              <span class="item-val">0元</span>
            </div>
            <div class="item">
              <span class="item-name">运费：</span>
              <span class="item-val">0元</span>
            </div>
            <div class="item-total">
              <span class="item-name">应付总额：</span>
              <span class="item-val">{{cartTotalPrice}}元</span>
            </div>
          </div>
          <div class="btn-group">
            <a href="/#/cart" class="btn btn-default btn-large">返回购物车</a>
            <a href="javascript:;" class="btn btn-large" @click="orderSubmit">去结算</a>
          </div>
        </div>
      </div>
    </div>

    <modal
      title="新增地址"
      btnType="1"
      :showModal="showEditModal"
      @cancel="showEditModal=false"
      @submit="submitAddress"
    >
      <template v-slot:body>
        <div class="edit-wrap">
          <div class="item">
            <input type="text" class="input" placeholder="姓名" v-model="checkedItem.receiverName">
            <input type="text" class="input" placeholder="手机号" v-model="checkedItem.receiverMobile">
          </div>
          <div class="item">
            <select v-model='checkedItem.receiverProvince' @change="changeCity()">
              <option v-for="(item,i) in items">{{item.name}}</option>
            </select>

            <select v-model='checkedItem.receiverCity' @change="changeCity1">
            <option v-for="(item,i) in cityArr">{{item.name}}</option>
          </select>
          </div>
          <div class="item">
            <textarea name="street"  placeholder="详细地址" v-model="checkedItem.receiverAddress"></textarea>
          </div>
          <div class="item">
            <input type="text" class="input" placeholder="邮编" v-model="checkedItem.receiverZip">
          </div>
        </div>
      </template>
    </modal>

    <modal
      title="删除确认"
      btnType="1"
      :showModal="showDelModal"
      @cancel="showDelModal=false"
      @submit="submitAddress"
    >
      <template v-slot:body>
        <p>您确认要删除此地址吗？</p>
      </template>
    </modal>
  </div>
</template>
<script>
import Modal from './../components/Modal'
import OrderHeader from './../components/OrderHeader'
export default {
  name: 'order-confirm',
  components: {
    Modal,
    OrderHeader
  },
  data () {
    return {

      city:'',
      items:[
        {
          code: "11",
          name: "北京市",
          children: [
            {
              code: "110101",
              name: "东城区"
            },
            {
              code: "110102",
              name: "西城区"
            },
            {
              code: "110105",
              name: "朝阳区"
            },
            {
              code: "110106",
              name: "丰台区"
            },
            {
              code: "110107",
              name: "石景山区"
            },
            {
              code: "110108",
              name: "海淀区"
            },
            {
              code: "110109",
              name: "门头沟区"
            },
            {
              code: "110111",
              name: "房山区"
            },
            {
              code: "110112",
              name: "通州区"
            },
            {
              code: "110113",
              name: "顺义区"
            },
            {
              code: "110114",
              name: "昌平区"
            },
            {
              code: "110115",
              name: "大兴区"
            },
            {
              code: "110116",
              name: "怀柔区"
            },
            {
              code: "110117",
              name: "平谷区"
            },
            {
              code: "110118",
              name: "密云区"
            },
            {
              code: "110119",
              name: "延庆区"
            }
          ]
        },
        {
          code: "12",
          name: "天津市",
          children: [
            {
              code: "120101",
              name: "和平区"
            },
            {
              code: "120102",
              name: "河东区"
            },
            {
              code: "120103",
              name: "河西区"
            },
            {
              code: "120104",
              name: "南开区"
            },
            {
              code: "120105",
              name: "河北区"
            },
            {
              code: "120106",
              name: "红桥区"
            },
            {
              code: "120110",
              name: "东丽区"
            },
            {
              code: "120111",
              name: "西青区"
            },
            {
              code: "120112",
              name: "津南区"
            },
            {
              code: "120113",
              name: "北辰区"
            },
            {
              code: "120114",
              name: "武清区"
            },
            {
              code: "120115",
              name: "宝坻区"
            },
            {
              code: "120116",
              name: "滨海新区"
            },
            {
              code: "120117",
              name: "宁河区"
            },
            {
              code: "120118",
              name: "静海区"
            },
            {
              code: "120119",
              name: "蓟州区"
            }
          ]
        },
        {
          code: "13",
          name: "河北省",
          children: [
            {
              code: "1301",
              name: "石家庄市"
            },
            {
              code: "1302",
              name: "唐山市"
            },
            {
              code: "1303",
              name: "秦皇岛市"
            },
            {
              code: "1304",
              name: "邯郸市"
            },
            {
              code: "1305",
              name: "邢台市"
            },
            {
              code: "1306",
              name: "保定市"
            },
            {
              code: "1307",
              name: "张家口市"
            },
            {
              code: "1308",
              name: "承德市"
            },
            {
              code: "1309",
              name: "沧州市"
            },
            {
              code: "1310",
              name: "廊坊市"
            },
            {
              code: "1311",
              name: "衡水市"
            }
          ]
        },
        {
          code: "14",
          name: "山西省",
          children: [
            {
              code: "1401",
              name: "太原市"
            },
            {
              code: "1402",
              name: "大同市"
            },
            {
              code: "1403",
              name: "阳泉市"
            },
            {
              code: "1404",
              name: "长治市"
            },
            {
              code: "1405",
              name: "晋城市"
            },
            {
              code: "1406",
              name: "朔州市"
            },
            {
              code: "1407",
              name: "晋中市"
            },
            {
              code: "1408",
              name: "运城市"
            },
            {
              code: "1409",
              name: "忻州市"
            },
            {
              code: "1410",
              name: "临汾市"
            },
            {
              code: "1411",
              name: "吕梁市"
            }
          ]
        },
        {
          code: "15",
          name: "内蒙古自治区",
          children: [
            {
              code: "1501",
              name: "呼和浩特市"
            },
            {
              code: "1502",
              name: "包头市"
            },
            {
              code: "1503",
              name: "乌海市"
            },
            {
              code: "1504",
              name: "赤峰市"
            },
            {
              code: "1505",
              name: "通辽市"
            },
            {
              code: "1506",
              name: "鄂尔多斯市"
            },
            {
              code: "1507",
              name: "呼伦贝尔市"
            },
            {
              code: "1508",
              name: "巴彦淖尔市"
            },
            {
              code: "1509",
              name: "乌兰察布市"
            },
            {
              code: "1522",
              name: "兴安盟"
            },
            {
              code: "1525",
              name: "锡林郭勒盟"
            },
            {
              code: "1529",
              name: "阿拉善盟"
            }
          ]
        },
        {
          code: "21",
          name: "辽宁省",
          children: [
            {
              code: "2101",
              name: "沈阳市"
            },
            {
              code: "2102",
              name: "大连市"
            },
            {
              code: "2103",
              name: "鞍山市"
            },
            {
              code: "2104",
              name: "抚顺市"
            },
            {
              code: "2105",
              name: "本溪市"
            },
            {
              code: "2106",
              name: "丹东市"
            },
            {
              code: "2107",
              name: "锦州市"
            },
            {
              code: "2108",
              name: "营口市"
            },
            {
              code: "2109",
              name: "阜新市"
            },
            {
              code: "2110",
              name: "辽阳市"
            },
            {
              code: "2111",
              name: "盘锦市"
            },
            {
              code: "2112",
              name: "铁岭市"
            },
            {
              code: "2113",
              name: "朝阳市"
            },
            {
              code: "2114",
              name: "葫芦岛市"
            }
          ]
        },
        {
          code: "22",
          name: "吉林省",
          children: [
            {
              code: "2201",
              name: "长春市"
            },
            {
              code: "2202",
              name: "吉林市"
            },
            {
              code: "2203",
              name: "四平市"
            },
            {
              code: "2204",
              name: "辽源市"
            },
            {
              code: "2205",
              name: "通化市"
            },
            {
              code: "2206",
              name: "白山市"
            },
            {
              code: "2207",
              name: "松原市"
            },
            {
              code: "2208",
              name: "白城市"
            },
            {
              code: "2224",
              name: "延边朝鲜族自治州"
            }
          ]
        },
        {
          code: "23",
          name: "黑龙江省",
          children: [
            {
              code: "2301",
              name: "哈尔滨市"
            },
            {
              code: "2302",
              name: "齐齐哈尔市"
            },
            {
              code: "2303",
              name: "鸡西市"
            },
            {
              code: "2304",
              name: "鹤岗市"
            },
            {
              code: "2305",
              name: "双鸭山市"
            },
            {
              code: "2306",
              name: "大庆市"
            },
            {
              code: "2307",
              name: "伊春市"
            },
            {
              code: "2308",
              name: "佳木斯市"
            },
            {
              code: "2309",
              name: "七台河市"
            },
            {
              code: "2310",
              name: "牡丹江市"
            },
            {
              code: "2311",
              name: "黑河市"
            },
            {
              code: "2312",
              name: "绥化市"
            },
            {
              code: "2327",
              name: "大兴安岭地区"
            }
          ]
        },
        {
          code: "31",
          name: "上海市",
          children: [
            {
              code: "310101",
              name: "黄浦区"
            },
            {
              code: "310104",
              name: "徐汇区"
            },
            {
              code: "310105",
              name: "长宁区"
            },
            {
              code: "310106",
              name: "静安区"
            },
            {
              code: "310107",
              name: "普陀区"
            },
            {
              code: "310109",
              name: "虹口区"
            },
            {
              code: "310110",
              name: "杨浦区"
            },
            {
              code: "310112",
              name: "闵行区"
            },
            {
              code: "310113",
              name: "宝山区"
            },
            {
              code: "310114",
              name: "嘉定区"
            },
            {
              code: "310115",
              name: "浦东新区"
            },
            {
              code: "310116",
              name: "金山区"
            },
            {
              code: "310117",
              name: "松江区"
            },
            {
              code: "310118",
              name: "青浦区"
            },
            {
              code: "310120",
              name: "奉贤区"
            },
            {
              code: "310151",
              name: "崇明区"
            }
          ]
        },
        {
          code: "32",
          name: "江苏省",
          children: [
            {
              code: "3201",
              name: "南京市"
            },
            {
              code: "3202",
              name: "无锡市"
            },
            {
              code: "3203",
              name: "徐州市"
            },
            {
              code: "3204",
              name: "常州市"
            },
            {
              code: "3205",
              name: "苏州市"
            },
            {
              code: "3206",
              name: "南通市"
            },
            {
              code: "3207",
              name: "连云港市"
            },
            {
              code: "3208",
              name: "淮安市"
            },
            {
              code: "3209",
              name: "盐城市"
            },
            {
              code: "3210",
              name: "扬州市"
            },
            {
              code: "3211",
              name: "镇江市"
            },
            {
              code: "3212",
              name: "泰州市"
            },
            {
              code: "3213",
              name: "宿迁市"
            }
          ]
        },
        {
          code: "33",
          name: "浙江省",
          children: [
            {
              code: "3301",
              name: "杭州市"
            },
            {
              code: "3302",
              name: "宁波市"
            },
            {
              code: "3303",
              name: "温州市"
            },
            {
              code: "3304",
              name: "嘉兴市"
            },
            {
              code: "3305",
              name: "湖州市"
            },
            {
              code: "3306",
              name: "绍兴市"
            },
            {
              code: "3307",
              name: "金华市"
            },
            {
              code: "3308",
              name: "衢州市"
            },
            {
              code: "3309",
              name: "舟山市"
            },
            {
              code: "3310",
              name: "台州市"
            },
            {
              code: "3311",
              name: "丽水市"
            }
          ]
        },
        {
          code: "34",
          name: "安徽省",
          children: [
            {
              code: "3401",
              name: "合肥市"
            },
            {
              code: "3402",
              name: "芜湖市"
            },
            {
              code: "3403",
              name: "蚌埠市"
            },
            {
              code: "3404",
              name: "淮南市"
            },
            {
              code: "3405",
              name: "马鞍山市"
            },
            {
              code: "3406",
              name: "淮北市"
            },
            {
              code: "3407",
              name: "铜陵市"
            },
            {
              code: "3408",
              name: "安庆市"
            },
            {
              code: "3410",
              name: "黄山市"
            },
            {
              code: "3411",
              name: "滁州市"
            },
            {
              code: "3412",
              name: "阜阳市"
            },
            {
              code: "3413",
              name: "宿州市"
            },
            {
              code: "3415",
              name: "六安市"
            },
            {
              code: "3416",
              name: "亳州市"
            },
            {
              code: "3417",
              name: "池州市"
            },
            {
              code: "3418",
              name: "宣城市"
            }
          ]
        },
        {
          code: "35",
          name: "福建省",
          children: [
            {
              code: "3501",
              name: "福州市"
            },
            {
              code: "3502",
              name: "厦门市"
            },
            {
              code: "3503",
              name: "莆田市"
            },
            {
              code: "3504",
              name: "三明市"
            },
            {
              code: "3505",
              name: "泉州市"
            },
            {
              code: "3506",
              name: "漳州市"
            },
            {
              code: "3507",
              name: "南平市"
            },
            {
              code: "3508",
              name: "龙岩市"
            },
            {
              code: "3509",
              name: "宁德市"
            }
          ]
        },
        {
          code: "36",
          name: "江西省",
          children: [
            {
              code: "3601",
              name: "南昌市"
            },
            {
              code: "3602",
              name: "景德镇市"
            },
            {
              code: "3603",
              name: "萍乡市"
            },
            {
              code: "3604",
              name: "九江市"
            },
            {
              code: "3605",
              name: "新余市"
            },
            {
              code: "3606",
              name: "鹰潭市"
            },
            {
              code: "3607",
              name: "赣州市"
            },
            {
              code: "3608",
              name: "吉安市"
            },
            {
              code: "3609",
              name: "宜春市"
            },
            {
              code: "3610",
              name: "抚州市"
            },
            {
              code: "3611",
              name: "上饶市"
            }
          ]
        },
        {
          code: "37",
          name: "山东省",
          children: [
            {
              code: "3701",
              name: "济南市"
            },
            {
              code: "3702",
              name: "青岛市"
            },
            {
              code: "3703",
              name: "淄博市"
            },
            {
              code: "3704",
              name: "枣庄市"
            },
            {
              code: "3705",
              name: "东营市"
            },
            {
              code: "3706",
              name: "烟台市"
            },
            {
              code: "3707",
              name: "潍坊市"
            },
            {
              code: "3708",
              name: "济宁市"
            },
            {
              code: "3709",
              name: "泰安市"
            },
            {
              code: "3710",
              name: "威海市"
            },
            {
              code: "3711",
              name: "日照市"
            },
            {
              code: "3713",
              name: "临沂市"
            },
            {
              code: "3714",
              name: "德州市"
            },
            {
              code: "3715",
              name: "聊城市"
            },
            {
              code: "3716",
              name: "滨州市"
            },
            {
              code: "3717",
              name: "菏泽市"
            }
          ]
        },
        {
          code: "41",
          name: "河南省",
          children: [
            {
              code: "4101",
              name: "郑州市"
            },
            {
              code: "4102",
              name: "开封市"
            },
            {
              code: "4103",
              name: "洛阳市"
            },
            {
              code: "4104",
              name: "平顶山市"
            },
            {
              code: "4105",
              name: "安阳市"
            },
            {
              code: "4106",
              name: "鹤壁市"
            },
            {
              code: "4107",
              name: "新乡市"
            },
            {
              code: "4108",
              name: "焦作市"
            },
            {
              code: "4109",
              name: "濮阳市"
            },
            {
              code: "4110",
              name: "许昌市"
            },
            {
              code: "4111",
              name: "漯河市"
            },
            {
              code: "4112",
              name: "三门峡市"
            },
            {
              code: "4113",
              name: "南阳市"
            },
            {
              code: "4114",
              name: "商丘市"
            },
            {
              code: "4115",
              name: "信阳市"
            },
            {
              code: "4116",
              name: "周口市"
            },
            {
              code: "4117",
              name: "驻马店市"
            },
            {
              code: "419001",
              name: "济源市"
            }
          ]
        },
        {
          code: "42",
          name: "湖北省",
          children: [
            {
              code: "4201",
              name: "武汉市"
            },
            {
              code: "4202",
              name: "黄石市"
            },
            {
              code: "4203",
              name: "十堰市"
            },
            {
              code: "4205",
              name: "宜昌市"
            },
            {
              code: "4206",
              name: "襄阳市"
            },
            {
              code: "4207",
              name: "鄂州市"
            },
            {
              code: "4208",
              name: "荆门市"
            },
            {
              code: "4209",
              name: "孝感市"
            },
            {
              code: "4210",
              name: "荆州市"
            },
            {
              code: "4211",
              name: "黄冈市"
            },
            {
              code: "4212",
              name: "咸宁市"
            },
            {
              code: "4213",
              name: "随州市"
            },
            {
              code: "4228",
              name: "恩施土家族苗族自治州"
            },
            {
              code: "429004",
              name: "仙桃市"
            },
            {
              code: "429005",
              name: "潜江市"
            },
            {
              code: "429006",
              name: "天门市"
            },
            {
              code: "429021",
              name: "神农架林区"
            }
          ]
        },
        {
          code: "43",
          name: "湖南省",
          children: [
            {
              code: "4301",
              name: "长沙市"
            },
            {
              code: "4302",
              name: "株洲市"
            },
            {
              code: "4303",
              name: "湘潭市"
            },
            {
              code: "4304",
              name: "衡阳市"
            },
            {
              code: "4305",
              name: "邵阳市"
            },
            {
              code: "4306",
              name: "岳阳市"
            },
            {
              code: "4307",
              name: "常德市"
            },
            {
              code: "4308",
              name: "张家界市"
            },
            {
              code: "4309",
              name: "益阳市"
            },
            {
              code: "4310",
              name: "郴州市"
            },
            {
              code: "4311",
              name: "永州市"
            },
            {
              code: "4312",
              name: "怀化市"
            },
            {
              code: "4313",
              name: "娄底市"
            },
            {
              code: "4331",
              name: "湘西土家族苗族自治州"
            }
          ]
        },
        {
          code: "44",
          name: "广东省",
          children: [
            {
              code: "4401",
              name: "广州市"
            },
            {
              code: "4402",
              name: "韶关市"
            },
            {
              code: "4403",
              name: "深圳市"
            },
            {
              code: "4404",
              name: "珠海市"
            },
            {
              code: "4405",
              name: "汕头市"
            },
            {
              code: "4406",
              name: "佛山市"
            },
            {
              code: "4407",
              name: "江门市"
            },
            {
              code: "4408",
              name: "湛江市"
            },
            {
              code: "4409",
              name: "茂名市"
            },
            {
              code: "4412",
              name: "肇庆市"
            },
            {
              code: "4413",
              name: "惠州市"
            },
            {
              code: "4414",
              name: "梅州市"
            },
            {
              code: "4415",
              name: "汕尾市"
            },
            {
              code: "4416",
              name: "河源市"
            },
            {
              code: "4417",
              name: "阳江市"
            },
            {
              code: "4418",
              name: "清远市"
            },
            {
              code: "4419",
              name: "东莞市"
            },
            {
              code: "4420",
              name: "中山市"
            },
            {
              code: "4451",
              name: "潮州市"
            },
            {
              code: "4452",
              name: "揭阳市"
            },
            {
              code: "4453",
              name: "云浮市"
            }
          ]
        },
        {
          code: "45",
          name: "广西壮族自治区",
          children: [
            {
              code: "4501",
              name: "南宁市"
            },
            {
              code: "4502",
              name: "柳州市"
            },
            {
              code: "4503",
              name: "桂林市"
            },
            {
              code: "4504",
              name: "梧州市"
            },
            {
              code: "4505",
              name: "北海市"
            },
            {
              code: "4506",
              name: "防城港市"
            },
            {
              code: "4507",
              name: "钦州市"
            },
            {
              code: "4508",
              name: "贵港市"
            },
            {
              code: "4509",
              name: "玉林市"
            },
            {
              code: "4510",
              name: "百色市"
            },
            {
              code: "4511",
              name: "贺州市"
            },
            {
              code: "4512",
              name: "河池市"
            },
            {
              code: "4513",
              name: "来宾市"
            },
            {
              code: "4514",
              name: "崇左市"
            }
          ]
        },
        {
          code: "46",
          name: "海南省",
          children: [
            {
              code: "4601",
              name: "海口市"
            },
            {
              code: "4602",
              name: "三亚市"
            },
            {
              code: "4603",
              name: "三沙市"
            },
            {
              code: "4604",
              name: "儋州市"
            },
            {
              code: "469001",
              name: "五指山市"
            },
            {
              code: "469002",
              name: "琼海市"
            },
            {
              code: "469005",
              name: "文昌市"
            },
            {
              code: "469006",
              name: "万宁市"
            },
            {
              code: "469007",
              name: "东方市"
            },
            {
              code: "469021",
              name: "定安县"
            },
            {
              code: "469022",
              name: "屯昌县"
            },
            {
              code: "469023",
              name: "澄迈县"
            },
            {
              code: "469024",
              name: "临高县"
            },
            {
              code: "469025",
              name: "白沙黎族自治县"
            },
            {
              code: "469026",
              name: "昌江黎族自治县"
            },
            {
              code: "469027",
              name: "乐东黎族自治县"
            },
            {
              code: "469028",
              name: "陵水黎族自治县"
            },
            {
              code: "469029",
              name: "保亭黎族苗族自治县"
            },
            {
              code: "469030",
              name: "琼中黎族苗族自治县"
            }
          ]
        },
        {
          code: "50",
          name: "重庆市",
          children: [
            {
              code: "500101",
              name: "万州区"
            },
            {
              code: "500102",
              name: "涪陵区"
            },
            {
              code: "500103",
              name: "渝中区"
            },
            {
              code: "500104",
              name: "大渡口区"
            },
            {
              code: "500105",
              name: "江北区"
            },
            {
              code: "500106",
              name: "沙坪坝区"
            },
            {
              code: "500107",
              name: "九龙坡区"
            },
            {
              code: "500108",
              name: "南岸区"
            },
            {
              code: "500109",
              name: "北碚区"
            },
            {
              code: "500110",
              name: "綦江区"
            },
            {
              code: "500111",
              name: "大足区"
            },
            {
              code: "500112",
              name: "渝北区"
            },
            {
              code: "500113",
              name: "巴南区"
            },
            {
              code: "500114",
              name: "黔江区"
            },
            {
              code: "500115",
              name: "长寿区"
            },
            {
              code: "500116",
              name: "江津区"
            },
            {
              code: "500117",
              name: "合川区"
            },
            {
              code: "500118",
              name: "永川区"
            },
            {
              code: "500119",
              name: "南川区"
            },
            {
              code: "500120",
              name: "璧山区"
            },
            {
              code: "500151",
              name: "铜梁区"
            },
            {
              code: "500152",
              name: "潼南区"
            },
            {
              code: "500153",
              name: "荣昌区"
            },
            {
              code: "500154",
              name: "开州区"
            },
            {
              code: "500155",
              name: "梁平区"
            },
            {
              code: "500156",
              name: "武隆区"
            },
            {
              code: "500229",
              name: "城口县"
            },
            {
              code: "500230",
              name: "丰都县"
            },
            {
              code: "500231",
              name: "垫江县"
            },
            {
              code: "500233",
              name: "忠县"
            },
            {
              code: "500235",
              name: "云阳县"
            },
            {
              code: "500236",
              name: "奉节县"
            },
            {
              code: "500237",
              name: "巫山县"
            },
            {
              code: "500238",
              name: "巫溪县"
            },
            {
              code: "500240",
              name: "石柱土家族自治县"
            },
            {
              code: "500241",
              name: "秀山土家族苗族自治县"
            },
            {
              code: "500242",
              name: "酉阳土家族苗族自治县"
            },
            {
              code: "500243",
              name: "彭水苗族土家族自治县"
            }
          ]
        },
        {
          code: "51",
          name: "四川省",
          children: [
            {
              code: "5101",
              name: "成都市"
            },
            {
              code: "5103",
              name: "自贡市"
            },
            {
              code: "5104",
              name: "攀枝花市"
            },
            {
              code: "5105",
              name: "泸州市"
            },
            {
              code: "5106",
              name: "德阳市"
            },
            {
              code: "5107",
              name: "绵阳市"
            },
            {
              code: "5108",
              name: "广元市"
            },
            {
              code: "5109",
              name: "遂宁市"
            },
            {
              code: "5110",
              name: "内江市"
            },
            {
              code: "5111",
              name: "乐山市"
            },
            {
              code: "5113",
              name: "南充市"
            },
            {
              code: "5114",
              name: "眉山市"
            },
            {
              code: "5115",
              name: "宜宾市"
            },
            {
              code: "5116",
              name: "广安市"
            },
            {
              code: "5117",
              name: "达州市"
            },
            {
              code: "5118",
              name: "雅安市"
            },
            {
              code: "5119",
              name: "巴中市"
            },
            {
              code: "5120",
              name: "资阳市"
            },
            {
              code: "5132",
              name: "阿坝藏族羌族自治州"
            },
            {
              code: "5133",
              name: "甘孜藏族自治州"
            },
            {
              code: "5134",
              name: "凉山彝族自治州"
            }
          ]
        },
        {
          code: "52",
          name: "贵州省",
          children: [
            {
              code: "5201",
              name: "贵阳市"
            },
            {
              code: "5202",
              name: "六盘水市"
            },
            {
              code: "5203",
              name: "遵义市"
            },
            {
              code: "5204",
              name: "安顺市"
            },
            {
              code: "5205",
              name: "毕节市"
            },
            {
              code: "5206",
              name: "铜仁市"
            },
            {
              code: "5223",
              name: "黔西南布依族苗族自治州"
            },
            {
              code: "5226",
              name: "黔东南苗族侗族自治州"
            },
            {
              code: "5227",
              name: "黔南布依族苗族自治州"
            }
          ]
        },
        {
          code: "53",
          name: "云南省",
          children: [
            {
              code: "5301",
              name: "昆明市"
            },
            {
              code: "5303",
              name: "曲靖市"
            },
            {
              code: "5304",
              name: "玉溪市"
            },
            {
              code: "5305",
              name: "保山市"
            },
            {
              code: "5306",
              name: "昭通市"
            },
            {
              code: "5307",
              name: "丽江市"
            },
            {
              code: "5308",
              name: "普洱市"
            },
            {
              code: "5309",
              name: "临沧市"
            },
            {
              code: "5323",
              name: "楚雄彝族自治州"
            },
            {
              code: "5325",
              name: "红河哈尼族彝族自治州"
            },
            {
              code: "5326",
              name: "文山壮族苗族自治州"
            },
            {
              code: "5328",
              name: "西双版纳傣族自治州"
            },
            {
              code: "5329",
              name: "大理白族自治州"
            },
            {
              code: "5331",
              name: "德宏傣族景颇族自治州"
            },
            {
              code: "5333",
              name: "怒江傈僳族自治州"
            },
            {
              code: "5334",
              name: "迪庆藏族自治州"
            }
          ]
        },
        {
          code: "54",
          name: "西藏自治区",
          children: [
            {
              code: "5401",
              name: "拉萨市"
            },
            {
              code: "5402",
              name: "日喀则市"
            },
            {
              code: "5403",
              name: "昌都市"
            },
            {
              code: "5404",
              name: "林芝市"
            },
            {
              code: "5405",
              name: "山南市"
            },
            {
              code: "5406",
              name: "那曲市"
            },
            {
              code: "5425",
              name: "阿里地区"
            }
          ]
        },
        {
          code: "61",
          name: "陕西省",
          children: [
            {
              code: "6101",
              name: "西安市"
            },
            {
              code: "6102",
              name: "铜川市"
            },
            {
              code: "6103",
              name: "宝鸡市"
            },
            {
              code: "6104",
              name: "咸阳市"
            },
            {
              code: "6105",
              name: "渭南市"
            },
            {
              code: "6106",
              name: "延安市"
            },
            {
              code: "6107",
              name: "汉中市"
            },
            {
              code: "6108",
              name: "榆林市"
            },
            {
              code: "6109",
              name: "安康市"
            },
            {
              code: "6110",
              name: "商洛市"
            }
          ]
        },
        {
          code: "62",
          name: "甘肃省",
          children: [
            {
              code: "6201",
              name: "兰州市"
            },
            {
              code: "6202",
              name: "嘉峪关市"
            },
            {
              code: "6203",
              name: "金昌市"
            },
            {
              code: "6204",
              name: "白银市"
            },
            {
              code: "6205",
              name: "天水市"
            },
            {
              code: "6206",
              name: "武威市"
            },
            {
              code: "6207",
              name: "张掖市"
            },
            {
              code: "6208",
              name: "平凉市"
            },
            {
              code: "6209",
              name: "酒泉市"
            },
            {
              code: "6210",
              name: "庆阳市"
            },
            {
              code: "6211",
              name: "定西市"
            },
            {
              code: "6212",
              name: "陇南市"
            },
            {
              code: "6229",
              name: "临夏回族自治州"
            },
            {
              code: "6230",
              name: "甘南藏族自治州"
            }
          ]
        },
        {
          code: "63",
          name: "青海省",
          children: [
            {
              code: "6301",
              name: "西宁市"
            },
            {
              code: "6302",
              name: "海东市"
            },
            {
              code: "6322",
              name: "海北藏族自治州"
            },
            {
              code: "6323",
              name: "黄南藏族自治州"
            },
            {
              code: "6325",
              name: "海南藏族自治州"
            },
            {
              code: "6326",
              name: "果洛藏族自治州"
            },
            {
              code: "6327",
              name: "玉树藏族自治州"
            },
            {
              code: "6328",
              name: "海西蒙古族藏族自治州"
            }
          ]
        },
        {
          code: "64",
          name: "宁夏回族自治区",
          children: [
            {
              code: "6401",
              name: "银川市"
            },
            {
              code: "6402",
              name: "石嘴山市"
            },
            {
              code: "6403",
              name: "吴忠市"
            },
            {
              code: "6404",
              name: "固原市"
            },
            {
              code: "6405",
              name: "中卫市"
            }
          ]
        },
        {
          code: "65",
          name: "新疆维吾尔自治区",
          children: [
            {
              code: "6501",
              name: "乌鲁木齐市"
            },
            {
              code: "6502",
              name: "克拉玛依市"
            },
            {
              code: "6504",
              name: "吐鲁番市"
            },
            {
              code: "6505",
              name: "哈密市"
            },
            {
              code: "6523",
              name: "昌吉回族自治州"
            },
            {
              code: "6527",
              name: "博尔塔拉蒙古自治州"
            },
            {
              code: "6528",
              name: "巴音郭楞蒙古自治州"
            },
            {
              code: "6529",
              name: "阿克苏地区"
            },
            {
              code: "6530",
              name: "克孜勒苏柯尔克孜自治州"
            },
            {
              code: "6531",
              name: "喀什地区"
            },
            {
              code: "6532",
              name: "和田地区"
            },
            {
              code: "6540",
              name: "伊犁哈萨克自治州"
            },
            {
              code: "6542",
              name: "塔城地区"
            },
            {
              code: "6543",
              name: "阿勒泰地区"
            },
            {
              code: "659001",
              name: "石河子市"
            },
            {
              code: "659002",
              name: "阿拉尔市"
            },
            {
              code: "659003",
              name: "图木舒克市"
            },
            {
              code: "659004",
              name: "五家渠市"
            },
            {
              code: "659005",
              name: "北屯市"
            },
            {
              code: "659006",
              name: "铁门关市"
            },
            {
              code: "659007",
              name: "双河市"
            },
            {
              code: "659008",
              name: "可克达拉市"
            },
            {
              code: "659009",
              name: "昆玉市"
            },
            {
              code: "659010",
              name: "胡杨河市"
            }
          ]
        }
      ],
      cityArr:[],
      checkedItem: {
        receiverProvince:'北京市',
        receiverCity:''
      }, // 被操作的表单项
      list: [], // 收货地址列表
      cartList: [], // 购物车中需要结算的商品列表
      cartTotalPrice: 0, // 商品总金额
      count: 0, // 商品结算数量
      userAction: '', // 用户行为: 0新增、1编辑、2删除
      showDelModal: false, // 是否显示删除弹框
      showEditModal: false, // 是否显示新增或者编辑弹框
      checkIndex: 0// 当前收货地址选中索引
    }
  },
  mounted () {
    this.getAddressList()
    this.getCartList()

    this.changeCity();
    this.changeCity1();
  },
  methods: {

    changeCity:function(){//省切换
      var me=this;
      var item ;
      me.items.forEach(function(ele){
        if(ele.name===me.checkedItem.receiverProvince){//判断与prov是否相等，相等的表示被切换选中的省份
          item = ele;
        }
      })
      if(item){
        this.cityArr=item.children;//将选中的item的sub设置给cityArr 用于显示市
        this.city=item.children[0].name;//默认选择第一个市

      }

    },
    changeCity1:function(){//市切换
      var me=this;
      var item ;
      me.cityArr.forEach(function(ele){
        if(ele.name===me.checkedItem.receiverCity){//判断与city是否相等，相等的表示被切换选中的市
          item = ele;
        }
      })
    },

    getAddressList () {
      this.axios.get('http://localhost:8080/shippings/getAll',{
        params:{
          username:sessionStorage.getItem('username')
        }
      }).then((res) => {
        this.list = res.data.addreList
      })
    },
    // 打开新增地址弹框
    openAddressModal () {
      this.userAction = 0
      this.checkedItem = {}
      this.showEditModal = true
    },
    // 打开编辑地址弹框
    editAddressModal (item) {
      this.userAction = 1
      this.checkedItem = item
      this.showEditModal = true
    },
    // 打开删除地址弹框
    delAddress (item) {
      this.checkedItem = item
      this.userAction = 2
      this.showDelModal = true
    },
    // 地址删除、编辑、新增功能
    submitAddress () {
      const { checkedItem, userAction } = this
      let method
      let url
      let params = {}
      if (userAction === 0) {
        method = 'post'
        url = 'http://localhost:8080/shippings/push'
      } else if (userAction === 1) {
        method = 'put'
        url = `http://localhost:8080/shippings/${checkedItem.id}`
      } else {
        method = 'delete'
        url = `http://localhost:8080/shippings/${checkedItem.id}`
      }
      if (userAction === 0 || userAction === 1) {
        const { receiverName, receiverMobile, receiverProvince, receiverCity, receiverAddress, receiverZip } = checkedItem
        let errMsg = ''
        if (!receiverName) {
          errMsg = '请输入收货人名称'
        } else if (!receiverMobile || !/\d{11}/.test(receiverMobile)) {
          errMsg = '请输入正确格式的手机号'
        } else if (!receiverProvince) {
          errMsg = '请选择省份'
        } else if (!receiverCity) {
          errMsg = '请选择对应的城市'
        } else if (!receiverAddress || !receiverCity) {
          errMsg = '请输入收货地址'
        } else if (!/\d{6}/.test(receiverZip)) {
          errMsg = '请输入六位邮编'
        }
        if (errMsg) {
          this.$message.error(errMsg)
          return
        }
        params = {
          receiverName,
          receiverMobile,
          receiverProvince,
          receiverCity,
          receiverAddress,
          receiverZip,
          username:sessionStorage.getItem('username')
        }
      }
      this.axios[method](url, params).then(() => {
        this.closeModal()
        this.getAddressList()
        this.$message.success('操作成功')
      })
    },
    closeModal () {
      this.checkedItem = {}
      this.userAction = ''
      this.showDelModal = false
      this.showEditModal = false
    },
    getCartList () {
      this.axios.get('http://localhost:8080/carts/getcarts',{
        params:{
          username: sessionStorage.getItem('username')
        }
      }).then((res) => {
        const list = res.data.list// 获取购物车中所有商品数据
        this.cartTotalPrice = res.cartTotalPrice// 商品总金额
        this.cartList = list.filter(item => item.productSelected)
        this.cartList.map((item) => {
          this.count += item.count
        })
      })
    },
    // 订单提交
    orderSubmit () {
      const item = this.list[this.checkIndex]
      if (!item) {
        this.$message.error('请选择一个收货地址')
        return
      }
      this.axios.post('http://localhost:8080/orders/createorder', {
        name:sessionStorage.getItem('username'),
        shippingId: item.id
      }).then((res) => {
        if(res.status === 1){
          this.$message.error('库存不足,下单失败');

          this.$router.push({
            path: '/',
          })

        }
        this.$router.push({
          path: '/order/pay',
          query: {
            orderNo: res.data.orderNo
          }
        })
      })
    }
  }
}
</script>
<style lang="scss">
  .order-confirm{
    .wrapper{
      background-color:#F5F5F5;
      padding-top:30px;
      padding-bottom:84px;
      .order-box{
        background-color:#ffffff;
        padding-left: 40px;
        padding-bottom: 40px;
        .addr-title{
          font-size: 20px;
          color: #333333;
          font-weight: 200;
          margin-bottom:21px;
        }
        .item-address{
          padding-top: 38px;
          .addr-list{
            .addr-info,.addr-add{
              box-sizing:border-box;
              float: left;
              width:271px;
              height:180px;
              border:1px solid #E5E5E5;
              margin-right: 15px;
              padding: 15px 24px;
              font-size: 14px;
              color:#757575;
            }
            .addr-info{
              cursor:pointer;
              h2{
                height:27px;
                font-size:18px;
                font-weight: 300;
                color:#333;
                margin-bottom:10px;
              }
              .street{
                height:50px;
              }
              .action{
                height:50px;
                line-height:50px;
                .icon{
                  width: 20px;
                  height: 20px;
                  fill: #666666;
                  vertical-align: middle;
                  &:hover{
                    fill: #FF6700;
                  }
                }
              }
              &.checked{
                border:1px solid #ff6700;
              }
            }
            .addr-add{
              text-align:center;
              color: #999999;
              cursor:pointer;
              .icon-add{
                width:30px;
                height:30px;
                border-radius:50%;
                background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-add.png') #E0E0E0 no-repeat center;
                background-size:14px;
                margin: 0 auto;
                margin-top: 45px;
                margin-bottom: 10px;
              }
            }
          }
        }
        .item-good{
          margin-top:34px;
          border-bottom: 1px solid #E5E5E5;
          padding-bottom: 12px;
          h2{
            border-bottom:1px solid #E5E5E5;
            padding-bottom: 5px;
          }
          li{
            display:flex;
            align-items: center;
            height:40px;
            line-height:40px;
            margin-top:10px;
            font-size:16px;
            color:#333333;
            .good-name{
              flex:5;
              img{
                width:30px;
                height:30px;
                vertical-align:middle;
              }
            }
            .good-price{
              flex:2;
            }
            .good-total{
              padding-right:44px;
              color:#FF6600;
            }
          }
        }
        .item-shipping,.item-invoice{
          margin-top:31px;
          line-height: 20px;
          h2{
            display: inline-block;
            margin-right: 71px;
            font-size: 20px;
            width: 80px;
          }
          span,a{
            font-size:16px;
            color:#FF6700;
            margin-right:23px;
          }
        }
        .detail{
          padding: 50px 44px 33px 0;
          border-bottom: 1px solid #f5f5f5;
          text-align: right;
          font-size: 16px;
          color: #666666;
          .item-val{
            color:#FF6700;
          }
          .item{
            line-height: 15px;
            margin-bottom: 12px;
          }
          .item-val{
            display:inline-block;
            width:100px;
          }
          .item-total{
            .item-val{
              font-size:28px;
            }
          }
        }
        .btn-group{
          margin-top: 37px;
          text-align: right;
        }
      }
    }
    .edit-wrap{
      font-size:14px;
      .item{
        margin-bottom:15px;
        .input{
          display:inline-block;
          width:283px;
          height:40px;
          line-height:40px;
          padding-left:15px;
          border:1px solid #E5E5E5;
          // 给.input类的兄弟元素添加样式
          &+.input{
            margin-left:14px;
          }
        }
        select{
          height:40px;
          line-height:40px;
          border:1px solid #E5E5E5;
          margin-right:15px;
        }
        textarea{
          height:62px;
          width:100%;
          padding:13px 15px;
          box-sizing:border-box;
          border:1px solid #E5E5E5;
        }
      }
    }
  }
</style>
