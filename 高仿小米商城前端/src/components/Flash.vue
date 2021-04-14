<template>

  <div class="flash">
    <div class="flash-box clearfix">
      <div class="items1 items2 fl">
        <a href="#">
          <p class="thun-red">14:00</p>
          <img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/colock.jpg" class="clock-img">
          <p class="thun">距离结束还有</p>
          <div id="first" class="time-item">
            <strong class="hour_show">00</strong>
            <strong class="minute_show">00</strong>
            <strong class="second_show">00</strong>
          </div>
        </a>
      </div>
      <div class="items1 fl">
        <a href="#">
          <img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/sp1.jpg" class="goods-img1">
          <p class="thun">小米全面屏电视43英寸 E43K 黑色 43英寸</p>
          <p class="desc">全面屏设计，海量内容</p>
          <p class="price">379元&nbsp;<del>399元</del></p>
        </a>
      </div>
      <div class="items1 fl">
        <a href="#">
          <img src="img/index/content/ia_100003550 (1).png" class="goods-img1">
          <p class="thun">小米抱枕 米色 40寸</p>
          <p class="desc">人体工学设计，尽享舒适</p>
          <p class="price">99元&nbsp;<del>69元</del></p>
        </a>
      </div>
      <div class="items1 fl">
        <a href="#">
          <img src="img/index/content/ia_100000001803.png" class="goods-img1">
          <p class="thun">小米智能语音 E43K 白色 小爱同学</p>
          <p class="desc">智慧设计，人工助手</p>
          <p class="price">279元&nbsp;<del>259元</del></p>
        </a>
      </div>
      <div class="items1 fl">
        <a href="#">
          <img src="img/index/content/ia_100000001812.png" class="goods-img1">
          <p class="thun">小米自动电转 E43K 黑色 </p>
          <p class="desc">手感设计，快速稳定</p>
          <p class="price">179元&nbsp;<del>159元</del></p>
        </a>
      </div>
    </div>
    <div class="ad-img">
      <a href="">
        <img src="img/index/content/sp-note.webp">
      </a>
    </div>

  </div>

</template>

<script>
export default {
name: "Flash"
}
</script>

<style scoped>

.title {
  color: #333;
  font-size: 22px;
  font-weight: 200;
  line-height: 58px;
  text-align: left;
}
.title li{
  font-weight: 400;
  font-size: 17px;
  height: 43px;
  margin-left: 15px;
  padding: 0;
}
.title li.active{
  color: #FF6700;
  border-bottom: 2px solid #FF6700;
}
.qie .content-box .elc-box:nth-child(2),
.qie .content-box .elc-box:nth-child(3)
{
  display: none;
}

.qie .content-box .elc-box:nth-child(3) {
  display: none;
}
/* .jiadian  .content-box .elc-box:first-child {
	display: block;
} */

.items1 {
  width: 234px;
  height: 339px;
  border-top: 1px solid red;
  background-color: white;
  float: left;
  margin-left: 14px;
}

.items2 {
  margin-left: 0;
}
.time-item{
  margin-top: 20px;
}
.time-item strong {
  display: inline-block;
  background: #555555;
  color: #fff;
  width: 50px;
  height: 50px;
  line-height: 50px;
  font-size: 24px;
  font-family: Arial;
  margin-right: 7px;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}


.item-title .unit {
  background: none;
  line-height: 49px;
  font-size: 24px;
  padding: 0 10px;
  float: left;
}
.flash-box>div:nth-child(2) {
  border-top-color: #00AB88;
}

.flash-box>div:nth-child(3) {
  border-top-color: #007AFF;
}

.flash-box>div:nth-child(4) {
  border-top-color: #FF6700;
}

.flash-box>div:nth-child(5) {
  border-top-color: #00AB88;
}

.goods-img1 {
  width: 160px;
  margin: 39px 0 12px 0;
  padding-bottom: 22px;
}

.thun {
  width: 194px;
  height: 21px;
  margin-bottom: 3px;
  margin: 0 auto;
  font-size: 14px;
  color: #121212;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.desc {
  width: 194px;
  height: 18px;
  margin-bottom: 22px;
  margin: 0 auto;
  font-size: 12px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.price {
  padding: 15px 0;
  color: #FF6700;
  font-size: 14px;
}

.price>del {
  color: #b0b0b0;
}

.clock-img {
  width: 34px;
  margin: 25px 0;
}

.   thun-red {
  font-size: 21px;
  color: red;
  margin-top: 54px;
}

.ad-img {
  width: 100%;
  margin: 22px 0;
}
</style>
