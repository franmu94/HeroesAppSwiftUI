//
//  ListaEquiposView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 6/5/24.
//

import SwiftUI

struct ListaEquiposView: View {
    
    @ObservedObject var evm = EquiposViewModel()
    
    @State var showCreate = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(evm.equipos) { equipo in
                    NavigationLink(value: equipo) {
                        EquipoRow(equipo: equipo)
                    }
                }

            }
            .navigationTitle("Equipos")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showCreate.toggle()
                    } label: {
                        Text("Nuevo Equipo")
                    }
                }
            }
           
            .navigationDestination(for: EquipoModel.self) { equipo in
                DetailEquipo(equipo: equipo)
            }
            .navigationDestination(isPresented: $showCreate, destination: {
                CreacionEquipoView(evm: evm)
            })
           
            
        }
        
    }
}

#Preview {
    ListaEquiposView()
}
