//
//  HeroeMinicard.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 14/5/24.
//

import SwiftUI

struct HeroeMinicard: View {
    let heroe: Heroe
    var isCap = false
    
    var colorFondo: Color {
        UIImage(named: heroe.imagen)?.AverageColor() ?? .white
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Image(heroe.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(alignment: .bottomLeading) {
                    Image("LogoCapi")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .padding(3)
                        .opacity(isCap ? 1 : 0)
                }

            Text(heroe.apodo)
                .lineLimit(2)
                .font(.caption2)
                .multilineTextAlignment(.center)
                .bold()
                .frame(width: 75)
                .padding(4)
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.gray.opacity(0.25))
                        .frame(height: 16)
                    
                }
        }
        .padding(8)

        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(colorFondo.opacity(0.25))
                .frame(width: 100,height: 135)

        }
        
        
    }
    
}

#Preview {
    HeroeMinicard(heroe: .preview)
}
