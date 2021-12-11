// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》https://cxyxy.blog.csdn.net/article/details/121134634
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：花生皮编程

import SwiftUI

struct HspView: View {
    private let predefinedSeconds: [Int] = [10, 30, 60, 120, 300]
    private let symbolActive = "play.circle.fill"
    private let symbolInactive = "pause.circle.fill"
    private let timerFont = Font.custom("DBLCDTempBlack", size: 48)
    
    @State var isStarted: Bool
    @State var remainingSeconds: Int
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        _remainingSeconds = State(initialValue: 60)
        _isStarted = State(initialValue: false)
    }
    
    var body: some View {
        VStack {
            Text("\(getTimeString(from: remainingSeconds))")
                .font(timerFont)
            HStack {
                ForEach (predefinedSeconds, id: \.self) { seconds in
                    Button(getButtonString(from: seconds)) {
                        addSeconds(seconds)
                    }.padding(2)
                }
            }.padding()
            
            Button(action: {
                isStarted.toggle()
            }, label: {
                Image(systemName: isStarted ? symbolInactive : symbolActive)
                    .font(.system(size: 80))
            }).padding()
        }.onReceive(timer) { _ in
            if isStarted && remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                isStarted = false
            }
        }
    }
    
    private func addSeconds(_ seconds: Int) {
        remainingSeconds += seconds
    }
    
    private func getTimeString(from totalSeconds: Int) -> String {
        let hours = totalSeconds / 3600
        let minutes = totalSeconds / 60 % 60
        let seconds = totalSeconds % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    private func getButtonString(from totalSeconds: Int) -> String {
        if totalSeconds >= 60 {
            return "+\(totalSeconds / 60) 分"
        } else {
            return "+\(totalSeconds) 秒"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HspView()
    }
}
