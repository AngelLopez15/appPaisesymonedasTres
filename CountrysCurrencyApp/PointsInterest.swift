//
//  PointsInterest.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 15/06/24.
//

struct PaisesData: Codable {
    let Paises: [Paises]
}

struct Paises: Codable {
    let EstadosUnidos: [Estado]?
    let Canada: [Estado]?
    let Mexico: [Estado]?
    let Brasil: [Estado]?
    let Argentina: [Estado]?
    let España: [Estado]?
    let Francia: [Estado]?
    let Alemania: [Estado]?
    let Japon: [Estado]?
    let China: [Estado]?

    enum CodingKeys: String, CodingKey {
        case EstadosUnidos = "Estados Unidos"
        case Canada
        case Mexico
        case Brasil
        case Argentina
        case España
        case Francia
        case Alemania
        case Japon
        case China
    }
}

struct Estado: Codable {
    let estado: String
    let lugares: [String]
}


