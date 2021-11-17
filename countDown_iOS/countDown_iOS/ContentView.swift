//
//  ContentView.swift
//  countDown_iOS
//
//  Created by jerry on 2021/11/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CountdownTimerView(seconds: 60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
