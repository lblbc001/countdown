package cn.hsp.demo;

import cn.hsp.demo.slice.HspAbilitySlice;
import ohos.aafwk.ability.Ability;
import ohos.aafwk.content.Intent;
/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */
public class HspAbility extends Ability {

    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setMainRoute(HspAbilitySlice.class.getName());
    }
}