package cn.hsp.demo;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.CheckBox;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */
public class HspActivity extends AppCompatActivity {
    private final int interval = 50;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private TextView addTenSecondsTv;
    private TextView addThirtySecondsTv;
    private TextView addOneMinuteTv;
    private CheckBox clickButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hsp);
        addTenSecondsTv = findViewById(R.id.addTenSecondsTv);
        addThirtySecondsTv = findViewById(R.id.addThirtySecondsTv);
        addOneMinuteTv = findViewById(R.id.addOneMinuteTv);

    }

    private void startTimer() {
        handler.postDelayed(this::changeBalls, interval);
    }

    private void stopTimer() {
        handler.removeCallbacksAndMessages(null);
    }

    private void changeBalls() {

    }
}