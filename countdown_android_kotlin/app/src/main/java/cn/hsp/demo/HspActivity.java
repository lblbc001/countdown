package cn.hsp.demo;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */
public class HspActivity extends AppCompatActivity {
    private final int interval = 1000;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private TextView timeTv;
    private TextView addTenSecondsTv;
    private TextView addThirtySecondsTv;
    private TextView addOneMinuteTv;
    private CheckBox checkbox;
    private int remainingSeconds = 60;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hsp);
        timeTv = findViewById(R.id.timeTv);
        addTenSecondsTv = findViewById(R.id.addTenSecondsTv);
        addThirtySecondsTv = findViewById(R.id.addThirtySecondsTv);
        addOneMinuteTv = findViewById(R.id.addOneMinuteTv);
        checkbox = findViewById(R.id.checkbox);

        updateTimeTv();
        setListeners();
    }

    private void setListeners() {
        addTenSecondsTv.setOnClickListener(v -> addTime(10));
        addThirtySecondsTv.setOnClickListener(v -> addTime(30));
        addOneMinuteTv.setOnClickListener(v -> addTime(60));
        checkbox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
                if (isChecked) {
                    startTimer();
                } else {
                    stopTimer();
                }
            }
        });
    }

    private void addTime(int seconds) {
        remainingSeconds += seconds;
        updateTimeTv();
    }

    private void updateTimeTv() {
        timeTv.setText(getTimeString());
    }

    @SuppressLint("DefaultLocale")
    private String getTimeString() {
        int hours = remainingSeconds / 3600;
        int minutes = remainingSeconds / 60 % 60;
        int seconds = remainingSeconds % 60;
        return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }

    private void startTimer() {
        handler.postDelayed(this::changeTime, interval);
    }

    private void stopTimer() {
        handler.removeCallbacksAndMessages(null);
    }

    private void changeTime() {
        if (remainingSeconds > 0) {
            remainingSeconds--;
            updateTimeTv();
            handler.postDelayed(this::changeTime, interval);
        } else {
            stopTimer();
            Toast.makeText(this, "时间到啦！", Toast.LENGTH_SHORT).show();
            checkbox.setChecked(false);
        }
    }
}