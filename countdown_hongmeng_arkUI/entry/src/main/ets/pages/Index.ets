import prompt from '@ohos.prompt'

@Entry
@Component
struct Index {
  interval = 0
  isStarted = false
  remainingSeconds = 10
  @State displayTime: string = '00:00:10'
  @State startPauseButtonText: string = '开始'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
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
        Button({ type: ButtonType.Capsule, stateEffect: false }) {
          Text('重置').fontSize(17).fontColor(Color.White)
        }
        .backgroundColor('#6c6c6c')
        .margin(50)
        .height(80)
        .width(80)
        .onClick(() => {
          this.resetTimer()
        })

        Button({ type: ButtonType.Capsule, stateEffect: false }) {
          Text(this.startPauseButtonText).fontSize(17).fontColor(Color.White)
        }
        .backgroundColor('#489cf5')
        .margin(50)
        .height(80)
        .width(80)
        .onClick(() => {
          this.startOrPauseTimer()
        })
      }.margin({ top: 100 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }

  addTime(timeInSeconds: number) {
    this.remainingSeconds += timeInSeconds
    this.displayTime = this.formatTime(this.remainingSeconds)
  }

  startOrPauseTimer() {
    if (this.isStarted) {
      if (this.interval != 0) {
        clearInterval(this.interval)
        this.interval = 0
      }
      this.startPauseButtonText = '开始'
    } else {
      this.startPauseButtonText = '暂停'

      if (this.interval == 0) {
        this.interval = setInterval(() => {
          if (this.remainingSeconds > 0) {
            this.remainingSeconds--
            this.displayTime = this.formatTime(this.remainingSeconds)
          } else {

            AlertDialog.show({
              title: "提示",
              message: "时间到啦",
              confirm: {
                value: "确定",
                action: () => {
                }
              }
            });
            this.resetTimer()
          }
        }, 1000)
      }
    }

    this.isStarted = !this.isStarted
  }

  resetTimer() {
    if (this.interval != 0) {
      clearInterval(this.interval)
      this.interval = 0
    }
    this.remainingSeconds = 0
    this.displayTime = this.formatTime(this.remainingSeconds)
    this.isStarted = false
    this.startPauseButtonText = '开始'
  }

  formatTime(remainingSeconds) {
    var hour = parseInt(remainingSeconds / 3600 + '')
    var hourStr = hour.toString()
    if (hour < 10) hourStr = '0' + hour
    var minute = parseInt((remainingSeconds % 3600 / 60) + '')
    var minuteStr = minute.toString()
    if (minute < 10) minuteStr = '0' + minute
    var seconds = remainingSeconds % 60
    var secondsStr = seconds.toString()
    if (seconds < 10) {
      secondsStr = '0' + seconds
    }
    return `${hourStr}:${minuteStr}:${secondsStr}`
  }
}