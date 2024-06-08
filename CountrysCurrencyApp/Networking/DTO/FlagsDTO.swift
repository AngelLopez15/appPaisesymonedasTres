//
//  FlagsDTO.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import Foundation

struct FlagsDTO: Decodable {
    let country: String
    let code: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let keyValue = try container.decode(String.self)
        let parts = keyValue.split(separator: " ")
        self.country = String(parts[0])
        self.code = String(parts[1])
    }
}
