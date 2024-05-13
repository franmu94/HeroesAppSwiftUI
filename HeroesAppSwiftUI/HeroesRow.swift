//
//  HeroesRow.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import SwiftUI

struct HeroesRow: View {
    let heroe: Heroe
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(heroe.apodo)
                    .font(.headline)
                Text(heroe.nombreReal)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(heroe.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    List {
        HeroesRow(heroe: .preview)
    }
}
