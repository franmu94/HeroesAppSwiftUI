//
//  HeroesTabView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 15/4/24.
//

import SwiftUI

struct HeroesTabView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "figure.arms.open")
                        Text("Heroes")
                    }
                    
                }
            PoderesGridView()
                .tabItem {
                    VStack{
                        Image(systemName: "bolt.fill")
                        Text("Poderes")
                    }
                }
            ListaEquiposView()
                .tabItem {
                    Label ("Equipos", systemImage: "person.3")
                }
        }
    }
}     

#Preview {
    HeroesTabView()
}
