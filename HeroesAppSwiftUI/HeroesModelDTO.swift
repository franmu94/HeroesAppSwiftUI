//
//  File.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import Foundation


struct HeroeDTO: Codable {
    let id: String
    let nombreReal: String
    let apodo: String
    let descripcion: String?
    let historia: String?
    let descripcionHistoria: String?
    let edad: Int
    let poderes: [Poderes]
    let imagen: String
    
    var toPresentation: Heroe {
        Heroe(id: id, nombreReal: nombreReal, apodo: apodo, Historia: descripcionHistoria ?? "Historia no disponible", edad: edad, poderes: poderes, imagen: imagen)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.nombreReal = try container.decode(String.self, forKey: .nombreReal)
        self.apodo = try container.decode(String.self, forKey: .apodo)
        
        self.descripcion = try container.decodeIfPresent(String.self, forKey: .descripcion)
        self.historia = try container.decodeIfPresent(String.self, forKey: .historia)
        self.descripcionHistoria = self.descripcion == nil ? self.historia : self.descripcion // Este será el valor con el que trabajaré
        
        self.edad = try container.decode(Int.self, forKey: .edad)
        
        do {
            self.poderes = try container.decode([Poderes].self, forKey: .poderes)

        } catch {
            let poderesStringLower = try container.decode([String].self, forKey: .poderes).map { $0.lowercased() }

            self.poderes = Poderes.allCases.filter { poderesStringLower.contains($0.rawValue.lowercased()) }            
        }
        self.imagen = try container.decode(String.self, forKey: .imagen)

        

    }

}
