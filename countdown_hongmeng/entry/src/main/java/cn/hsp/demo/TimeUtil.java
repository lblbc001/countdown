package cn.hsp.demo;
/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：花生皮编程
 */
public class TimeUtil {
    public static String formatTime(long time) {
        String timeStr;
        long hour, minute, second, millisecond;
        if (time <= 0)
            return "00:00:00.000";
        else {
            second = time / 1000;
            minute = second / 60;
            millisecond = time % 1000;
            if (second < 60) {
                timeStr = "00:00:" + fillZeros(second) + "." + fillZerosForMilliSeconds(millisecond);
            } else if (minute < 60) {
                second = second % 60;
                timeStr = "00:" + fillZeros(minute) + ":" + fillZeros(second) + "." + fillZerosForMilliSeconds(millisecond);
            } else {//数字>=3600 000的时候
                hour = minute / 60;
                minute = minute % 60;
                second = second - hour * 3600 - minute * 60;
                timeStr = fillZeros(hour) + ":" + fillZeros(minute) + ":" + fillZeros(second) + "." + fillZerosForMilliSeconds(millisecond);
            }
        }
        return timeStr;
    }

    private static String fillZeros(long time) {//时分秒的格式转换
        String result;
        if (time >= 0 && time < 10)
            result = "0" + time;
        else
            result = "" + time;
        return result;
    }

    private static String fillZerosForMilliSeconds(long time) {//毫秒的格式转换
        String retStr;
        if (time >= 0 && time < 10)
            retStr = "00" + time;
        else if (time >= 10 && time < 100) {
            retStr = "0" + time;
        } else
            retStr = "" + time;
        return retStr;
    }
}