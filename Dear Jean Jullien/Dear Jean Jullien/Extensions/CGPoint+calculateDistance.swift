//
//  CGPoint+CalculateDistance.swift
//  Dear Jean Jullien
//
//  Created by 박진형 on 2023/01/29.
//

import Foundation

extension CGPoint {
    func calculateDistance(to point: CGPoint) -> CGFloat {
        return sqrt(pow((point.x - x), 2) + pow((point.y - y), 2))
    }
}
