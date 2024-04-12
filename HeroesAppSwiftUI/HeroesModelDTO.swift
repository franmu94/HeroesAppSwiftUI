//
//  File.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 8/4/24.
//

import Foundation


struct Heroe: Codable {
    let id: String
    let nombreReal: String
    let apodo: String
    let descripcion: String?
    let historia: String?
    let descripcionHistoria: String?
    let edad: Int
    let poderes: [Poderes]
    let imagen: String
    
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
            self.poderes = try container.decode([Heroe.Poderes].self, forKey: .poderes)

        } catch {
            let poderesStringLower = try container.decode([String].self, forKey: .poderes).map { $0.lowercased() }

            self.poderes = Poderes.allCases.filter { poderesStringLower.contains($0.rawValue.lowercased()) }
            
            //print(error)
        }
        self.imagen = try container.decode(String.self, forKey: .imagen)

        

    }
    enum Poderes: String, Codable, CaseIterable{
        case comunicacionMarina = "Comunicación con Vida Marina"
        case invulnerabilidad = "Invulnerabilidad"
        case manipulacionSombras = "Manipulación de Sombras"
        case manipulacionAgua = "Manipulación del Agua"
        case manipulacionClima = "Manipulación del Clima"
        case manipulacionFuego = "Manipulación del Fuego"
        case manipulacionMental = "Manipulación Mental"
        case pielMetalica = "Piel Metálica"
        case regeneracion = "Regeneración"
        case superFuerza = "Super Fuerza"
        case telepatia = "Telepatía"
        case teletransportacionATravesDeSombras = "Teletransportación a través de Sombras"
        case transformacionEnFormaAcuática = "Transformación en Forma Acuática"
        case vuelo = "Vuelo"
        case amplificacionSonido = "Amplificación del Sonido"
        case controlElemental = "Control Elemental"
        case controlVibraciones = "Control de Vibraciones"
        case creacionRocas = "Creación de Rocas"
        case creacionTornados = "Creación de Tornados"
        case duplicacion = "Duplicación"
        case emisionLuz = "Emisión de Luz"
        case generacionVibraciones = "Generación de Vibraciones"
        case giroRapido = "Giro Rápido"
        case imitacionSonido = "Imitación de Sonido"
        case intangibilidad = "Intangibilidad"
        case invisibilidad = "Invisibilidad"
        case manipulacionLuz = "Manipulación de la Luz"
        case manipulacionTiempo = "Manipulación del Tiempo"
        case manipulacionTierra = "Manipulación de la Tierra"
        case teleTransportacion = "Teletransportación"
        case visionRayosX = "Visión de Rayos X"
    }


}
