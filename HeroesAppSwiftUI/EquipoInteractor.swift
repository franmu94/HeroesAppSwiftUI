//
//  EquipoInteractor.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 7/5/24.
//

import Foundation

struct EquipoInteractor: DataInteractorEquipos {

    static let shared = EquipoInteractor()

    func loadEquipos() throws -> [EquipoModel] {
        let saveURL = URL.documentsDirectory.appending(path: "savedEquipos.json")
        
        print("Se intenta recuperar")
        print(saveURL)
        if FileManager.default.fileExists(atPath: saveURL.path()) {
            let data = try Data(contentsOf: saveURL)
            return try JSONDecoder().decode([EquipoModel].self, from: data)
        } else {
            print("No se recupero")
            return []
        }
        
        
    }
    
    func saveEquipos(equipos: [EquipoModel]) throws {
        let url = URL.documentsDirectory.appending(path: "savedEquipos.json")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let encodedData = try encoder.encode(equipos)
        try encodedData.write(to: url, options: .atomic)
        print("se ha guardado")
        print(url)
    }
    
    
    
}

