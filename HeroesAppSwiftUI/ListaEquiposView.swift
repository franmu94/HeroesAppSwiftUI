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
                    EquipoRow(equipo: equipo)
                }

            }
            .navigationTitle("Equipos")
            .navigationDestination(for: Heroe.self) { heroe in
                HeroesDetailView(heroe1: heroe)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showCreate.toggle()
                        print(showCreate)
                    } label: {
                        Text("Nuevo Equipo")
                    }
                }
            }
            .navigationDestination(isPresented: $showCreate, destination: {
                CreacionEquipoView(evm: evm)
            })
            /*.sheet(isPresented: $showCreate, content: {
                CreacionEquipoView(evm: evm)
            })*/
            
        }
        
    }
}

#Preview {
    ListaEquiposView()
}
