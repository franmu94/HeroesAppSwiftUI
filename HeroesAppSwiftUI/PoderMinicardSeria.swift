//
//  PoderMinicardSeria.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 14/4/24.
//

import SwiftUI

struct PoderMinicardSeria: View {
    let poder: Poderes
    
    
    var colorFondo: Color {
        UIImage(named: poder.rawValue)?.AverageColor() ?? .white
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Image(poder.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 80)
            Text(poder.rawValue)
                .lineLimit(2)
                .font(.caption2)
                .multilineTextAlignment(.center)
                .bold()
                .frame(width: 85)
                .padding(4)
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.gray.opacity(0.25))
                        .frame(height: 36)
                }
        }
        .padding(8)

        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(colorFondo.opacity(0.25))
                .frame(height: 135)

        }
        
    }
    
}

#Preview {
    PoderMinicardSeria(poder: .manipulacionAgua)
}
