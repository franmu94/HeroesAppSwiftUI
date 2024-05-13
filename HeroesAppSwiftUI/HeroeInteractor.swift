//
//  HeroeInteractor.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import Foundation

struct HeroeInteractor: DataInteractor {
    
    static let shared = HeroeInteractor()
    
    
    func loadHeroes() throws -> [Heroe] {
        guard let url = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json") else { return [] }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([HeroeDTO].self, from: data).map { $0.toPresentation }
    }
    
    func saveHeroe(heroes: [Heroe]) throws {
    }
}
