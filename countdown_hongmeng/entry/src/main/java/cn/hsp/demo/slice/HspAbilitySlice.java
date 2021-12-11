package cn.hsp.demo.slice;

import cn.hsp.demo.TimeUtil;
import cn.hsp.demo.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;
import ohos.agp.components.Component;
import ohos.agp.components.Image;
import ohos.agp.components.Text;
import ohos.agp.window.dialog.ToastDialog;
import ohos.eventhandler.EventHandler;
import ohos.eventhandler.EventRunner;

import java.util.Timer;
import java.util.TimerTask;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */
public class HspAbilitySlice extends AbilitySlice {
    private Timer timer;
    private final int interval = 1000;
    private Text timeText;
    private Text addTenSecondsTv;
    private Text addThirtySecondsTv;
    private Text addOneMinuteTv;
    private Image startImage;
    private Image pauseImage;
    private int remainingSeconds = 60;
    private EventHandler eventHandler = new EventHandler(EventRunner.current());

    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_hsp);
        timeText = findComponentById(ResourceTable.Id_time_text);
        addTenSecondsTv = findComponentById(ResourceTable.Id_addTenSecondsTv);
        addThirtySecondsTv = findComponentById(ResourceTable.Id_addThirtySecondsTv);
        addOneMinuteTv = findComponentById(ResourceTable.Id_addOneMinuteTv);
        startImage = findComponentById(ResourceTable.Id_start_image);
        pauseImage = findComponentById(ResourceTable.Id_pause_image);
        addTenSecondsTv.setClickedListener(component -> addTime(10));
        addThirtySecondsTv.setClickedListener(component -> addTime(30));
        addOneMinuteTv.setClickedListener(component -> addTime(60));
        startImage.setClickedListener(component -> startTimer());
        pauseImage.setClickedListener(component -> stopTimer());
    }

    private void startTimer() {
        timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                eventHandler.postTask(() -> changeTime());
            }
        }, 0, interval);
        showPauseBtn();
    }

    private void stopTimer() {
        timer.cancel();
        showStartBtn();
    }

    private void addTime(int seconds) {
        remainingSeconds += seconds;
        updateTimeTv();
    }

    private void changeTime() {
        if (remainingSeconds > 0) {
            remainingSeconds--;
            updateTimeTv();
        } else {
            stopTimer();
            new ToastDialog(getContext()).setText("时间到啦！").show();
        }
    }

    private void updateTimeTv() {
        timeText.setText(getTimeString());
    }

    private String getTimeString() {
        int hours = remainingSeconds / 3600;
        int minutes = remainingSeconds / 60 % 60;
        int seconds = remainingSeconds % 60;
        return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }

    private void showStartBtn() {
        startImage.setVisibility(Component.VISIBLE);
        pauseImage.setVisibility(Component.HIDE);
    }

    private void showPauseBtn() {
        startImage.setVisibility(Component.HIDE);
        pauseImage.setVisibility(Component.VISIBLE);
    }


}
