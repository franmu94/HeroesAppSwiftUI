//
//  EquiposViewModel.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 6/5/24.
//

import SwiftUI

final class EquiposViewModel: ObservableObject {
    
    let interactor: DataInteractorEquipos
    
    @Published var equipos: [EquipoModel] = [] {
        didSet {
            try? interactor.saveEquipos(equipos: equipos)
        }
    }
    

    
    init(interactor: DataInteractorEquipos = EquipoInteractor()) {
        self.interactor = interactor
        getEquipos()
    }
    
    func getEquipos() {
        do {
            equipos = try interactor.loadEquipos()
        } catch {
            print(error)
        }
    }
}
