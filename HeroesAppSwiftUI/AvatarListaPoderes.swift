//
//  AvatarListaPoderes.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 10/4/24.
//

import SwiftUI

struct AvatarListaPoderes: View {
  
    let heroe: Heroe
    
    var body: some View {
        
        ForEach(heroe.poderes, id: \.self) { poder in
            VStack{
                Image(poder.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65)
                Text(poder.rawValue)
                    .multilineTextAlignment(.center)
                    .frame(width: 110)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.secondary)
                
            }
        }
    }
}

#Preview {
    AvatarListaPoderes(heroe: Heroe.preview)
}
