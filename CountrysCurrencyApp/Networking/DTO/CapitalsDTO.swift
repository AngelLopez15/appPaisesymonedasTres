//
//  CapitalsDTO.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 14/06/24.
//

import Foundation

// Define el struct para los estados
struct State: Codable {
    let estado: String
}

// Define el struct para el DTO general
struct CapitalsDTO: Codable {
    let estadosUnidos: [State]
    let canada: [State]
    let mexico: [State]
    let brasil: [State]
    let argentina: [State]
    let espana: [State]
    let francia: [State]
    let alemania: [State]
    let japon: [State]
    let china: [State]

    enum CodingKeys: String, CodingKey {
        case estadosUnidos = "Estados Unidos"
        case canada = "Canada"
        case mexico = "Mexico"
        case brasil = "Brasil"
        case argentina = "Argentina"
        case espana = "España"
        case francia = "Francia"
        case alemania = "Alemania"
        case japon = "Japon"
        case china = "China"
    }

    func getStates(for country: String) -> [String]? {
        switch country.lowercased() {
        case "estados unidos":
            return estadosUnidos.map { $0.estado }
        case "canada":
            return canada.map { $0.estado }
        case "mexico":
            return mexico.map { $0.estado }
        case "brasil":
            return brasil.map { $0.estado }
        case "argentina":
            return argentina.map { $0.estado }
        case "españa":
            return espana.map { $0.estado }
        case "francia":
            return francia.map { $0.estado }
        case "alemania":
            return alemania.map { $0.estado }
        case "japon":
            return japon.map { $0.estado }
        case "china":
            return china.map { $0.estado }
        default:
            return nil
        }
    }
}

class CapitalModel {
    var estados: [String]?
    
    func getCapi(pais:String) throws {
        // Lee el archivo JSON
        if let fileURL = Bundle.main.url(forResource: "Capitals", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let capitalsDTO = try decoder.decode([CapitalsDTO].self, from: data).first
                // Filtra los estados por país
                if let states = capitalsDTO?.getStates(for: pais) {
                    estados = states
                }
            } catch {
                print("Error leyendo o deserializando el archivo JSON: \(error)")
            }
        }
    }
}

