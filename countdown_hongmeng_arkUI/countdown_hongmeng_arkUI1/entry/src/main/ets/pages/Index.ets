/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 * 如果希望学习编程，了解秒表应用是如何一步一步做出来的，可以观看视频教程：
 * https://mp.weixin.qq.com/s?__biz=Mzg4ODEwODI4Mg==&mid=2247487665&idx=1&sn=32dbf1ac8969052ce9ede6017520eeb8&chksm=cf817524f8f6fc32c7a958099deab225f845a7ba8ddaafe35a0f972ac4d071b19115b2d141f8#rd
 */
@Entry
@Component
struct Index {
  @State displayTime: string = '00:00:10'

  build() {
    Row() {
      Column() {
        Text(this.displayTime).fontSize(40).fontColor(Color.White)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Black)
  }
}