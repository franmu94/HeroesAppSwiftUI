//
//  HeroesViewModel.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import SwiftUI

final class HeroesViewModel: ObservableObject {
    
    let interactor: DataInteractor
    
    @Published var heroes: [Heroe] = []

    
    init(interactor: DataInteractor = HeroeInteractor()) {
        self.interactor = interactor
        do {
            self.heroes = try interactor.loadHeroes()
        } catch {
            self.heroes = []
            print(error)
        }
    }
    
    func deleteHeroe(indexSet: IndexSet) {
        heroes.remove(atOffsets: indexSet)
    }
    
    func moveHeroe(indexSet: IndexSet, to: Int) {
        heroes.move(fromOffsets: indexSet, toOffset: to)
    }
    
    
    
}
