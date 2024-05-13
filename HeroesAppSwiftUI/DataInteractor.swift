//
//  DataInteractor.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import Foundation

protocol DataInteractor {
    func loadHeroes() throws -> [Heroe]
    func saveHeroe(heroes: [Heroe]) throws
}

protocol DataInteractorEquipos {
    func loadEquipos() throws -> [EquipoModel]
    func saveEquipos(equipos: [EquipoModel]) throws
}
