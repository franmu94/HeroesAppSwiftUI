//
//  ContentView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = HeroesViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(vm.heroes) { heroe in
                    NavigationLink(value: heroe){
                        HeroesRow(heroe: heroe)
                    }
                }
                .onDelete(perform: vm.deleteHeroe)
                .onMove(perform: vm.moveHeroe)

            }
            .navigationTitle("Heroes")
            .navigationDestination(for: Heroe.self) { heroe in
                HeroesDetailView(heroe1: heroe)
            }
        }
    }
}

#Preview {
    ContentView()
}


