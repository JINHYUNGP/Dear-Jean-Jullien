//
//  SurfingView.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/01/29.
//

import SwiftUI

struct SurfingView: View {
    
    @State private var draggedOffset: CGSize = .zero
    
    
    var body: some View {
        ZStack{
            Color("WaterColor")
                .ignoresSafeArea()
            SurferView()
                .offset(x: draggedOffset.width, y: 0)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.draggedOffset = value.translation
                        }
                        .onEnded { value in
                            self.draggedOffset = .zero
                        }
                )
                .animation(.easeIn(duration: 1), value: draggedOffset)
            
        }
    }
}



struct SurfingView_Previews: PreviewProvider {
    static var previews: some View {
        SurfingView()
    }
}
