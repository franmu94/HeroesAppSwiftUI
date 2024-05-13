//
//  PoderesGridView.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 12/4/24.
//

import SwiftUI

struct PoderesGridView: View {
    //let adaptative: [GridItem] = [GridItem(.adaptive(minimum: 115, maximum: 115), spacing: 0, alignment: .center)]
    let adaptative: [GridItem] = [GridItem(.adaptive(minimum: 115))]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptative, spacing: 30) {
                    ForEach(Poderes.allCases, id: \.self) { poder in
                        NavigationLink(value: poder) {
                            PoderMinicardSeria(poder: poder)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
            .navigationTitle("Poderes")
            .navigationDestination(for: Poderes.self) { poder in
                    ListaFiltradaPoder(poder: poder)
            }
        }
    }
}

#Preview {
    PoderesGridView()
}
