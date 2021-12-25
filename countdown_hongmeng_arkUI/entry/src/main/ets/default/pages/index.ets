@Entry
@Component
struct Index {
  interval = 0
  isStarted = false
  remainingSeconds = 0
  @State startPauseButtonText: string = '开始'
  @State displayTime: string = '00:00:00'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.displayTime).fontSize(40).fontColor(Color.White)
      Row() {
        Button({ type: ButtonType.Capsule, stateEffect: false }) {
          Text('+10秒').fontSize(17).fontColor(Color.White)
        }
        .backgroundColor('#6c6c6c')
        .margin(50)
        .height(80)
        .width(80)
        .onClick(() => {
          this.addTime(10)
        })

        Button({ type: ButtonType.Capsule, stateEffect: false }) {
          Text('+30秒').fontSize(17).fontColor(Color.White)
        }
        .backgroundColor('#40B955')
        .margin(50)
        .height(80)
        .width(80)
        .onClick(() => {
          this.addTime(30)
        })

        Button({ type: ButtonType.Capsule, stateEffect: false }) {
          Text('+30秒').fontSize(17).fontColor(Color.White)
        }
        .backgroundColor('#40B955')
        .margin(50)
        .height(80)
        .width(80)
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
        .backgroundColor('#40B955')
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

  addTime(timeInSeconds:number) {
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
          }
          else {
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
    var mm = parseInt(remainingSeconds / 3600 + '')
    var mmStr = mm.toString()
    if (mm < 10) mmStr = '0' + mm
    var ss = parseInt((remainingSeconds % 3600 / 60) + '')
    var ssStr = ss.toString()
    if (ss < 10) ssStr = '0' + ss
    var ssss = remainingSeconds % 60
    var ssssStr = ssss.toString()
    if (ssss < 10) {
      ssssStr = '0' + ssss
    }
    return `${mmStr}:${ssStr}:${ssssStr}`
  }
}