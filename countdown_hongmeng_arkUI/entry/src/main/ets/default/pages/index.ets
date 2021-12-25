@Entry
@Component
struct Index {
  interval = 0
  isStarted = false
  startTime = Date.now()
  lastTimeElapsed = 0
  @State timeElapsed: number = 0
  @State startPauseButtonText: string = '开始'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.formatTimeElapsed()).fontSize(40).fontColor(Color.White)
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

  startOrPauseTimer() {
    if (this.isStarted) {
      if (this.interval != 0) {
        clearInterval(this.interval)
        this.interval = 0
      }
      this.startTime
      this.lastTimeElapsed = Date.now() - this.startTime + this.lastTimeElapsed
      this.startPauseButtonText = '开始'
    } else {
      this.startTime = Date.now()
      this.startPauseButtonText = '暂停'

      if (this.interval == 0) {
        this.interval = setInterval(() => {
          this.timeElapsed = Date.now() - this.startTime + this.lastTimeElapsed
        }, 100)
      }
    }

    this.isStarted = !this.isStarted
  }

  resetTimer() {
    if (this.interval != 0) {
      clearInterval(this.interval)
      this.interval = 0
    }
    this.timeElapsed = 0
    this.lastTimeElapsed = 0
    this.isStarted = false
    this.startPauseButtonText = '开始'
  }

  formatTimeElapsed() {
    var mm = parseInt(this.timeElapsed / 1000 / 60 + '')
    var mmStr = mm.toString()
    if (mm < 10) mmStr = '0' + mm
    var ss = parseInt((this.timeElapsed / 1000) % 60 + '')
    var ssStr = ss.toString()
    if (ss < 10) ssStr = '0' + ss
    var ssss = this.timeElapsed % 1000
    var ssssStr = ssss.toString()
    if (ssss < 10) {
      ssssStr = '00' + ssss
    } else if (ssss < 100) {
      ssssStr = '0' + ssss
    }
    return `${mmStr}:${ssStr}:${ssssStr}`
  }
}