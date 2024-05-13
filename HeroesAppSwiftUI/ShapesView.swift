//
//  Sh<pesView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 14/4/24.
//

import SwiftUI

struct ShieldShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let topMiddle = CGPoint(x: rect.midX, y: rect.minY)
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottonMiddle = CGPoint(x: rect.midX, y: rect.maxY)
        
        
        
        path.move(to: topMiddle)

        
        path.addCurve(to: topLeft,
                      controlPoint1: CGPoint(x: rect.maxX * 0.25, y: rect.maxY / 5),
                      controlPoint2: CGPoint(x: 0, y: 0))
        
        path.addCurve(to: bottonMiddle,
                      controlPoint1: CGPoint(x: 0, y: 0),
                      controlPoint2: CGPoint(x: 0, y: rect.maxX / 2))
        

        
        path.move(to: topRight)

        path.addCurve(to: topMiddle,
                      controlPoint1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY / 5),
                      controlPoint2: CGPoint(x: rect.maxX * 0.5, y: 0))
        
        path.move(to: topRight)
        
        path.addCurve(to: bottonMiddle,
                      controlPoint1: CGPoint(x: rect.maxX, y: 0),
                      controlPoint2: CGPoint(x: rect.maxX, y: rect.maxX / 2))


        
        let pathC = Path(path.cgPath)
        let multiplier = 1.0
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return pathC.applying(transform)    }
}




struct ShapesView: View {
    var body: some View {
        ShieldShape()
            .stroke(Color.black, lineWidth: 3)
            .frame(width: 200, height:230)
    }
}

#Preview {
    ShapesView()
}
