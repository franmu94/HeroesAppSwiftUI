//
//  PoderMiniCard.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 12/4/24.
//

import SwiftUI

struct PoderMiniCard: View {
    let poder: Poderes
    
    
    var colorFondo: Color {
        UIImage(named: poder.rawValue)?.AverageColor() ?? .white
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Image(poder.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 85)
                .padding(30)
                .background {
                    Circle()
                        .fill(.radialGradient(colors: [colorFondo, .white],
                                              center: .center,
                                              startRadius: 20,
                                              endRadius: 60))
                }
            Text(poder.rawValue)
                .font(.caption)
                .multilineTextAlignment(.center)
                .bold()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
                .background {
                    Color(.white.opacity(0.9))
                }
        }
        
        .clipShape(Ellipse())
        
        .background {
            Ellipse()
                .fill(.radialGradient(colors: [.white, colorFondo],
                                      center: .center,
                                      startRadius: 80,
                                      endRadius: 180))
                .frame(width: 200,height: 280)
        }
    
        
        
        
        
        
        /*.background {
         Circle()
             .fill(.radialGradient(colors: [.white, colorFondo],
                                   center: .center,
                                   startRadius: 20,
                                   endRadius: 55))
         */
        
    }
}

#Preview {
    PoderMiniCard(poder: .amplificacionSonido)
}
