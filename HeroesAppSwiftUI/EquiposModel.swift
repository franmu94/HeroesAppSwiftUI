//
//  EquiposModel.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 6/5/24.
//

import Foundation


struct EquipoModel: Codable, Identifiable, Hashable {
    
    
    var id: Self { self }
        
    static let previewEquipo = EquipoModel(name: "Ejmeplo", members: [.preview,.preview,.preview2])
    let name: String
    var members: [Heroe]
    let captain: Heroe
    let powers: [Poderes]
    
    init(name: String, members: [Heroe]) {
        self.name = name
        self.members = members
        self.captain = members.first ?? .preview
        self.powers = Set(members.flatMap{ $0.poderes }).sorted { $0.rawValue > $1.rawValue}
    }
}
