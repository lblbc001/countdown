/**
 * 厦门大学计算机专业 | 华为开发专家(HDE)
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：鸿蒙 | Java | 安卓 | 前端 | Flutter | iOS | 小程序
 * 公众号：蓝不蓝编程
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