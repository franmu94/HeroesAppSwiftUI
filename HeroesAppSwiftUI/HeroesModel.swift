//
//  File.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import Foundation


struct Heroe: Codable, Identifiable, Hashable {
    
    let id: String
    let nombreReal: String
    let apodo: String
    let Historia: String
    let edad: Int
    let poderes: [Poderes]
    let imagen: String
    
    var añoNacimiento: Int {
        2024 - edad
    }
    
    
    var poderesLiteral: String {
        poderes.map { $0.rawValue }.joined(separator: ", ")
    }
}



