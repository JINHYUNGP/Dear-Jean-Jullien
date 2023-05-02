//
//  ContentView.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/01/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FaceView()
                .tabItem {
                    Image(systemName: "face.smiling")
                }
            SurfingView()
                .tabItem {
                    Image(systemName: "figure.surfing")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
