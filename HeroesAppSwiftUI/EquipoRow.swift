//
//  EquipoRow.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 7/5/24.
//

import SwiftUI

struct EquipoRow: View {
    let equipo: EquipoModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(equipo.name)
                    .font(.headline)
                Text("Capitán: \(equipo.captain.apodo)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(equipo.captain.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    EquipoRow(equipo: .previewEquipo)
}
