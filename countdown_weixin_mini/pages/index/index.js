/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 **/
const hours = []
const minutes = []
const seconds = []
var interval = 0
var isStarted = false
var remainingSeconds = 10

for (let i = 0; i <= 9; i++) {
  hours.push(i)
}

for (let i = 0; i <= 59; i++) {
  minutes.push(i)
}

for (let i = 0; i <= 59; i++) {
  seconds.push(i)
}

Page({
  data: {
    hours,
    minutes,
    seconds,
    displayTime: '00:00:10',
    value: [0, 0, 0],
    startPauseButtonText: '开始',
  },

  bindChange(e) {
    const val = e.detail.value
    remainingSeconds = this.data.hours[val[0]] * 3600 + this.data.minutes[val[1]] * 60 + this.data.seconds[val[2]]
    this.setData({
      displayTime: this.formatTime(remainingSeconds)
    })
  },
  startOrPauseTimer() {
    if (isStarted) {
      if (interval != 0) {
        clearInterval(interval)
        interval = 0
      }
      this.setData({
        startPauseButtonText: '开始'
      })
    } else {
      this.setData({
        startPauseButtonText: '暂停'
      })

      if (interval == 0) {
        interval = setInterval(() => {
          if (remainingSeconds > 0) {
            remainingSeconds--
            this.setData({
              displayTime: this.formatTime(remainingSeconds)
            })
          }
          else {
            this.resetTimer()
          }
        }, 1000)
      }
    }

    isStarted = !isStarted
  },
  resetTimer() {
    if (interval != 0) {
      clearInterval(interval)
      interval = 0
    }
    remainingSeconds = 0
    isStarted = false
    this.setData({
      displayTime: this.formatTime(0),
      startPauseButtonText: '开始'
    })
  },
  formatTime(timeInSeconds) {
    var hour = parseInt(timeInSeconds / 3600)
    if (hour < 10) hour = '0' + hour
    var minute = parseInt(timeInSeconds % 3600 / 60)
    if (minute < 10) minute = '0' + minute
    var seconds = parseInt(timeInSeconds % 60)
    if (seconds < 10) {
      seconds = '0' + seconds
    }
    return `${hour}:${minute}:${seconds}`
  },
})