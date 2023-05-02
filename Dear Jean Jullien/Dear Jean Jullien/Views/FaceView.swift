//
//  FaceView.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/01/09.
//

import SwiftUI

struct FaceView: View {
    
    // 눈동자가 움직일 수 있는 범위를 설정하는 변수
    private var dragDiameter: CGFloat = 100.0
    
    // 제스쳐로 바뀌는 눈동자의 위치를 관장하는 변수
    @State var positionPoint: CGPoint =  CGPoint(x: 200, y: 250)
    
    // 눈동자의 원점을 나타내는 변수
    let zeroPoint: CGPoint = CGPoint(x: 200, y: 250)
    
    var body: some View {
        
        let drag = DragGesture()
            .onChanged({ dragValue in
                let currentLocationPoint = dragValue.location
                
                let distance = currentLocationPoint.calculateDistance(to: zeroPoint)

                if distance > self.dragDiameter / 2 {
                    let k = (self.dragDiameter / 2) / distance
                    
                    var newLocationPoint: CGPoint = .zero
                    newLocationPoint.x = (currentLocationPoint.x - zeroPoint.x) * k
                    newLocationPoint.y = ( currentLocationPoint.y - zeroPoint.y ) * k
                    
                    self.positionPoint = CGPoint(x: zeroPoint.x + newLocationPoint.x, y:  zeroPoint.y + newLocationPoint.y)
                }
                else {
                  
                    self.positionPoint = CGPoint(x: currentLocationPoint.x, y: currentLocationPoint.y)
                }
            })
            .onEnded { _ in
                positionPoint = zeroPoint
            }
        
        ZStack{
            Rectangle()
                .foregroundColor(Color("FaceColor"))
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    Image("eye")
                        .resizable()
                        .aspectRatio( contentMode:.fit)
                        .padding()
                        .padding(.top, -200)
                    Image("pupil")
                        .resizable()
                        .aspectRatio( contentMode:.fit)
                        .padding()
                        .position(x: positionPoint.x, y: positionPoint.y)
                        .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1
                                          ), value: positionPoint)
                    Image("mouth")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width:180)
                        .offset(y: 75)
                        
                }
                
            }
        }
        .gesture(drag)
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView()
    }
}
