//
//  DetailEquipo.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 7/5/24.
//

import SwiftUI

struct DetailEquipo: View {
    var equipo: EquipoModel
    
    var body: some View {
        
        
        Form {
            Section (header: Text("Miembros")) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))], spacing: 20) {
                    ForEach(equipo.members, id: \.self) { heroe in
                            ZStack {
                                
                                HeroeMinicard(heroe: heroe, isCap: heroe == equipo.captain)
                            }
                        }
                    }
            }
           
            Section(header: Text("Poderes"),footer: Text("\(equipo.powers.count) Poderes")) {
                ScrollView (.horizontal){
                    HStack(spacing: 0) {
                        AvatarListaPoderes(poderes: equipo.powers)
                    }
                }
            }
            .navigationTitle("\(equipo.name)")
           
        }
        
       
    }
}

#Preview {
    DetailEquipo(equipo: .previewEquipo)
}
