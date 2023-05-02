//
//  SurferView.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/01/30.
//

import SwiftUI

struct SurferView: View {
    var body: some View {
        ZStack{
            SurfingBoard()
                .frame(width: 50, height: 100)
                .offset(y: UIScreen.main.bounds.size.height/5 + 20)
                .foregroundColor(Color("BoardColor"))
            Image("surfer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .offset(y: UIScreen.main.bounds.size.height/5)
        }
    }
}

//MARK: 서핑 보드
struct SurfingBoard: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: (rect.maxX)/2 , y: rect.maxY), control: CGPoint(x: rect.minX, y: (rect.maxY) * (2/3) ))
        path.addQuadCurve(to: CGPoint(x: (rect.maxX) , y: rect.minY), control: CGPoint(x: rect.maxX, y: (rect.maxY) * (2/3) ))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}


struct SurferView_Previews: PreviewProvider {
    static var previews: some View {
        SurferView()
    }
}
