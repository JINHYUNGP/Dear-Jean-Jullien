//
//  WaveView.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/04/04.
//

import SwiftUI

struct Wave: Shape {
    let amplitude: CGFloat
    let frequency: CGFloat
    let phase: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let width = rect.width

        path.move(to: CGPoint(x: 0, y: height))

        let wavelength = width / frequency

        for x in stride(from: 0, to: width + 10, by: 10) {
            let relativeX = x / wavelength
            let y = amplitude * sin(relativeX + phase)
            path.addLine(to: CGPoint(x: x, y: height - y))
        }

        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()

        return path
    }
}

struct WaveView: View {
    let amplitude: CGFloat = 50
        let frequency: CGFloat = 100
        let speed: CGFloat = 10
        
        @State private var phase: CGFloat = 0
        
        var body: some View {
            Wave(amplitude: amplitude, frequency: frequency, phase: phase)
                .foregroundColor(.blue)
                .animation(Animation.linear(duration: speed).repeatForever(autoreverses: false))
                .onAppear() {
                    self.phase = .pi * 2
                }
        }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
