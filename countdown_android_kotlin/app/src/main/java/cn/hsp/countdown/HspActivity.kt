/**
 * 厦门大学计算机专业 | 华为开发专家(HDE)
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：鸿蒙 | Java | 安卓 | 前端 | Flutter | iOS | 小程序
 * 公众号：蓝不蓝编程
 */
package cn.hsp.countdown

import androidx.appcompat.app.AppCompatActivity
import android.os.Looper
import android.os.Bundle
import android.annotation.SuppressLint
import android.os.Handler
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_hsp.*

class HspActivity : AppCompatActivity() {
    private val interval = 1000
    private val handler = Handler(Looper.getMainLooper())
    private var remainingSeconds = 60
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_hsp)
        updateTimeTv()
        setListeners()
    }

    private fun setListeners() {
        addTenSecondsTv.setOnClickListener { addTime(10) }
        addThirtySecondsTv.setOnClickListener { addTime(30) }
        addOneMinuteTv.setOnClickListener { addTime(60) }
        checkbox.setOnCheckedChangeListener { _, isChecked ->
            if (isChecked) {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }

    private fun addTime(seconds: Int) {
        remainingSeconds += seconds
        updateTimeTv()
    }

    private fun updateTimeTv() {
        timeTv.text = timeString
    }

    @get:SuppressLint("DefaultLocale")
    private val timeString: String
        get() {
            val hours = remainingSeconds / 3600
            val minutes = remainingSeconds / 60 % 60
            val seconds = remainingSeconds % 60
            return String.format("%02d:%02d:%02d", hours, minutes, seconds)
        }

    private fun startTimer() {
        handler.postDelayed({ changeTime() }, interval.toLong())
    }

    private fun stopTimer() {
        handler.removeCallbacksAndMessages(null)
    }

    private fun changeTime() {
        if (remainingSeconds > 0) {
            remainingSeconds--
            updateTimeTv()
            handler.postDelayed({ changeTime() }, interval.toLong())
        } else {
            stopTimer()
            Toast.makeText(this, "时间到啦！", Toast.LENGTH_SHORT).show()
            checkbox.isChecked = false
        }
    }
}