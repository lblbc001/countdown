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
          Button({ stateEffect: false }) {
            Text('+10秒').fontSize(20).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(10)
          })

          Button({ type: ButtonType.Normal, stateEffect: false }) {
            Text('+30秒').fontSize(20).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(30)
          })

          Button({ type: ButtonType.Capsule, stateEffect: false }) {
            Text('+1分钟').fontSize(17).fontColor('#489cf5')
          }
          .backgroundColor(Color.Black)
          .margin(10)
          .onClick(() => {
            this.addTime(60)
          })
        }.margin({ top: 100 })

        Row() {
          Button() {
            Text('重置').fontColor(Color.White)
          }
          .backgroundColor('#6c6c6c')
          .margin(50)
          .height(80)
          .width(80)

          Button() {
            Text(this.startPauseButtonText).fontColor(Color.White)
          }
          .margin(50)
          .height(80)
          .width(80)
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