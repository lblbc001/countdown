package cn.hsp.demo

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.IconToggleButton
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.material.TextButton
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import cn.hsp.demo.ui.theme.Blue
import cn.hsp.demo.ui.theme.HspDemoTheme

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */

class MainActivity : ComponentActivity() {
    private val interval = 1000L
    private var remainingSeconds = mutableStateOf(60L)
    private var isStarted = mutableStateOf(false)
    private var handler = Handler(Looper.getMainLooper())

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            HspDemoTheme {
                Surface(
                    modifier = Modifier
                        .fillMaxSize()
                ) {
                    HspPage(remainingSeconds, isStarted) { cmd ->
                        when (cmd) {
                            CMD_START -> startTimer()
                            CMD_PAUSE -> stopTimer()
                        }
                    }
                }
            }
        }
    }

    private fun changeTime() {
        if (remainingSeconds.value > 0) {
            remainingSeconds.value -= 1
            handler.postDelayed({ changeTime() }, interval)
        } else {
            stopTimer()
            isStarted.value = false
            Toast.makeText(this, "时间到啦！", Toast.LENGTH_SHORT).show()
        }
    }

    private fun startTimer() {
        handler.postDelayed({ changeTime() }, interval)
    }

    private fun stopTimer() {
        handler.removeCallbacksAndMessages(null)
    }
}

@Composable
fun HspPage(
    _remainingSeconds: MutableState<Long>,
    _isStarted: MutableState<Boolean>,
    callBack: (Int) -> Unit
) {
    var remainingSeconds by remember { _remainingSeconds }
    var isStarted by remember { _isStarted }
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxSize(),
    ) {
        Text(formatTime(remainingSeconds), fontSize = 40.sp)
        Row(
            modifier = Modifier
                .padding(top = 20.dp)
        )
        {
            TextButton(
                onClick = { remainingSeconds += 10 },
            ) {
                Text("+10秒", color = Blue, fontSize = 25.sp)
            }
            TextButton(
                onClick = { remainingSeconds += 30 },
            ) {
                Text("+30秒", color = Blue, fontSize = 25.sp)
            }
            TextButton(
                onClick = { remainingSeconds += 60 },
            ) {
                Text("+1分钟", color = Blue, fontSize = 25.sp)
            }
        }
        IconToggleButton(
            modifier = Modifier.padding(top = 50.dp, start = 20.dp),
            checked = isStarted,
            onCheckedChange = {
                if (isStarted) {
                    callBack(CMD_PAUSE)
                } else {
                    callBack(CMD_START)
                }
                isStarted = it
            },
        ) {
            Image(painterResource(getImageRes(isStarted)), "")
        }
    }
}

@Composable
private fun getImageRes(isStarted: Boolean): Int {
    return if (isStarted) {
        R.drawable.ic_pause
    } else {
        R.drawable.ic_start
    }
}

fun formatTime(remainingSeconds: Long): String {
    val hours = remainingSeconds / 3600
    val minutes = remainingSeconds / 60 % 60
    val seconds = remainingSeconds % 60
    return String.format("%02d:%02d:%02d", hours, minutes, seconds)
}

val CMD_START = 1
val CMD_PAUSE = 2
