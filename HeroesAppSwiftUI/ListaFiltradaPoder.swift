//
//  ListaFiltradaPoder.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 15/4/24.
//

import SwiftUI

struct ListaFiltradaPoder: View {
    let poder: Poderes
    @ObservedObject var vm = HeroesViewModel()
    var lista: [Heroe] {
        vm.heroes.filter { $0.poderes.contains(poder) }
    }
    
    var body: some View {
        Text("Usuarios")
        ScrollView {
            ForEach(lista) { heroe in
                HeroesRow(heroe: heroe)
            }
            .padding()

        }
        .navigationTitle(poder.rawValue)
    }
}

#Preview {
    NavigationStack{
        ListaFiltradaPoder(poder: .vuelo)
    }
}
