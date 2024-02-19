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
  isStarted = false
  interval = 0
  remainingSeconds = 10
  @State displayTime: string = '00:00:10'
  @State startPauseButtonText: string = '开始'

  build() {
    Row() {
      Column() {
        Text(this.displayTime)
          .fontSize(40)
          .fontColor(Color.White)
        Row() {
          Button() {
            Text('+10秒').backgroundColor(Color.Black).fontColor('#489cf5').fontSize(20)
          }.margin(10)
          .onClick(() => {
            this.addTime(10)
          })

          Button() {
            Text('+30秒').backgroundColor(Color.Black).fontColor('#489cf5').fontSize(20)
          }.margin(10)
          .onClick(() => {
            this.addTime(30)
          })

          Button() {
            Text('+1分钟').backgroundColor(Color.Black).fontColor('#489cf5').fontSize(20)
          }.margin(10)
        }.margin({ top: 100 })
        .onClick(() => {
          this.addTime(60)
        })

        Row() {
          Button() {
            Text('重置').fontColor(Color.White)
          }
          .backgroundColor('#6c6c6c')
          .height(80)
          .width(80)
          .onClick(() => {
            this.resetTimer()
          })

          Button() {
            Text(this.startPauseButtonText).fontColor(Color.White)
          }
          .height(80)
          .width(80)
          .margin({ left: 50 })
          .onClick(() => {
            this.startOrPauseTimer()
          })
        }.margin({ top: 100 })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Black)
  }

  resetTimer() {
    clearInterval(this.interval)
    this.remainingSeconds = 0
    this.displayTime = this.formatTime()
    this.isStarted = false
    this.startPauseButtonText = '开始'
  }

  startOrPauseTimer() {
    if (this.isStarted) {
      clearInterval(this.interval)
      this.startPauseButtonText = '开始'
    } else {
      this.startPauseButtonText = '暂停'
      this.interval = setInterval(() => {
        if (this.remainingSeconds > 0) {
          this.remainingSeconds--
          this.displayTime = this.formatTime()
        } else {
          this.showDialog()
          this.resetTimer()
        }
      }, 1000)
    }
    this.isStarted = !this.isStarted
  }

  showDialog() {
    AlertDialog.show({
      title: '提示',
      message: '时间到啦',
      confirm: {
        value: '确定',
        action: () => {
        }
      }
    })
  }

  addTime(timeInSecond: number) {
    this.remainingSeconds += timeInSecond
    this.displayTime = this.formatTime()
  }

  formatTime() {
    var hour = this.convertNumberToStr(this.remainingSeconds / 3600)
    var minutes = this.convertNumberToStr(this.remainingSeconds % 3600 / 60)
    var seconds = this.convertNumberToStr(this.remainingSeconds % 60)
    var hourStr = hour.padStart(2, '0')
    var minutesStr = minutes.padStart(2, '0')
    var secondsStr = seconds.padStart(2, '0')
    return `${hourStr}:${minutesStr}:${secondsStr}`
  }

  convertNumberToStr(num: number) {
    return parseInt(num + '').toString()
  }
}