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
  interval = 0
  isStarted = false
  remainingSeconds = 10
  @State displayTime: string = '00:00:10'
  @State startPauseButtonText: string = '开始'

  build() {
    Row() {
      Column() {
        Text(this.displayTime).fontSize(40).fontColor(Color.White)
        Row() {
          Button() {
            Text('+10秒').fontSize(20).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(10)
          })

          Button() {
            Text('+30秒').fontSize(20).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(30)
          })

          Button() {
            Text('+1分钟').fontSize(17).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(60)
          })
        }.margin({ top: 100 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  addTime(timeInSeconds: number) {
    this.remainingSeconds += timeInSeconds
    this.displayTime = this.formatTime()
  }

  formatTime() {
    var hour = this.convertNumberToStr(this.remainingSeconds / 3600)
    var minute = this.convertNumberToStr(this.remainingSeconds % 3600 / 60)
    var seconds = this.convertNumberToStr(this.remainingSeconds % 60)
    var hourStr = hour.padStart(2, '0')
    var minuteStr = minute.padStart(2, '0')
    var secondsStr = seconds.padStart(2, '0')
    return `${hourStr}:${minuteStr}:${secondsStr}`
  }

  convertNumberToStr(num: number) {
    return parseInt(num + "").toString()
  }
}