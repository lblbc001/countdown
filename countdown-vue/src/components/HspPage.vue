<!--
 厦门大学计算机专业 | 前华为工程师
 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 公众号：花生皮编程
-->
<template>
  <div class="container">
    <div class="display-container">
      <span class="count-down">{{ displayTime }}</span>
    </div>

    <div class="time-buttons">
      <div class="time-button" @click="addTime(10)">
        <p class="button-text">+10秒</p>
      </div>
      <div class="time-button" @click="addTime(30)">
        <p class="button-text">+30秒</p>
      </div>
      <div class="time-button" @click="addTime(60)">
        <p class="button-text">+1分钟</p>
      </div>
    </div>

    <div class="button-container">
      <div class="button-reset-circle">
        <div class="button-reset" @click="resetTimer">
          <p class="button-text">重置</p>
        </div>
      </div>

      <div class="button-start-circle">
        <div class="button-start" @click="startOrPauseTimer">
          <span class="button-text">{{ startPauseButtonText }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HspPage',
  data() {
    return {
      startPauseButtonText: '开始',
      displayTime: '00:00:000',
      isStarted: false,
      lastTimeElapsed: 0,
      interval: 0,
      startTime: Date.now(),
      remainingSeconds: 0
    }
  },
  methods: {
    addTime(secondsToAdd) {
      this.remainingSeconds += secondsToAdd
      this.displayTime = this.formatTime(this.remainingSeconds)
    },
    startOrPauseTimer() {
      if (this.isStarted) {
        if (this.interval !== 0) {
          clearInterval(this.interval)
          this.interval = 0
        }
        this.startPauseButtonText = '开始'
      } else {
        this.startPauseButtonText = '暂停'

        if (this.interval === 0) {
          this.interval = setInterval(() => {
            if (this.remainingSeconds > 0) {
              this.remainingSeconds--
              this.displayTime = this.formatTime(this.remainingSeconds)
            } else {
              this.resetTimer()
            }
          }, 1000)
        }
      }

      this.isStarted = !this.isStarted
    },
    resetTimer() {
      if (this.interval !== 0) {
        clearInterval(this.interval)
        this.interval = 0
      }
      this.remainingSeconds = 0
      this.displayTime = this.formatTime(0)
      this.isStarted = false
      this.startPauseButtonText = '开始'
    },
    formatTime(timeInSeconds) {
      var mm = parseInt(timeInSeconds / 3600)
      if (mm < 10) mm = '0' + mm
      var ss = parseInt((timeInSeconds % 3600) / 60)
      if (ss < 10) ss = '0' + ss
      var ssss = parseInt(timeInSeconds % 60)
      if (ssss < 10) {
        ssss = '0' + ssss
      }
      return `${mm}:${ss}:${ssss}`
    }
  }
}
</script>

<style scoped>
.time-buttons {
  color: #2196f3;
  display: flex;
  justify-content: center;
}
.time-button {
  padding: 1rem;
}
.count-down {
  color: white;
  font-size: 3.4em;
  align-self: center;
}

.button-container {
  display: flex;
  flex-direction: row;
  flex: 1;
  justify-content: center;
  width: 100%;
  align-items: space-around;
  padding-top: 15rem;
}

.button-start-circle {
  background-color: #489cf5;
  height: 8.5rem;
  width: 8.5rem;
  border-radius: 50%;
  display: flex;
  align-items: center;
  margin: 1rem;
  justify-content: center;
}
.button-start {
  color: white;
  background-color: #489cf5;
  height: 8rem;
  width: 8rem;
  border-radius: 50%;
  border: 2px solid black;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button-reset-circle {
  background-color: #6c6c6c;
  height: 8.5rem;
  width: 8.5rem;
  border-radius: 50%;
  display: flex;
  align-items: center;
  margin: 1rem;
  justify-content: center;
}

.button-reset {
  display: flex;
  color: white;
  background-color: #6c6c6c;
  height: 8rem;
  width: 8rem;
  border: 2px solid black;
  border-radius: 50%;
  align-items: center;
  justify-content: center;
}

.button-text {
  font-size: 1.5em;
  font-weight: 400;
}
</style>
