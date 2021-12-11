package cn.hsp.demo.slice;

import cn.hsp.demo.TimeUtil;
import cn.hsp.demo.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;
import ohos.agp.components.Component;
import ohos.agp.components.Image;
import ohos.agp.components.Text;
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
    private final int interval = 50;
    private long startTime;
    private long timeElapsed;
    private Text timeText;
    private Image startImage;
    private Image pauseImage;
    private Image resetImage;
    private EventHandler eventHandler = new EventHandler(EventRunner.current());

    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_hsp);
        timeText = findComponentById(ResourceTable.Id_time_text);
        startImage = findComponentById(ResourceTable.Id_start_image);
        pauseImage = findComponentById(ResourceTable.Id_pause_image);
        resetImage = findComponentById(ResourceTable.Id_reset_image);
        startImage.setClickedListener(component -> startTimer());
        pauseImage.setClickedListener(component -> pauseTimer());
        resetImage.setClickedListener(component -> resetTimer());

    }

    private void startTimer() {
        startTime = System.currentTimeMillis();
        timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                long offset = System.currentTimeMillis() - startTime + timeElapsed;
                eventHandler.postTask(() -> timeText.setText(TimeUtil.formatTime(offset)));
            }
        }, 0, interval);
        showPauseBtn();
    }

    private void resetTimer() {
        timeElapsed = 0;
        timer.cancel();
        showStartBtn();
        eventHandler.postTask(() -> timeText.setText(getString(ResourceTable.String_default_time)), interval);
    }

    private void pauseTimer() {
        timer.cancel();
        timeElapsed += System.currentTimeMillis() - startTime;
        showStartBtn();
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
