//
//  FlagsModel.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class FlagsModel {
    var flags: [Flag] = []
    
    func flag(for index: Int) -> Flag? {
        flags.indices.contains(index) ? flags[index] : nil
    }
    
    func getFlags() -> Int {
        flags.count
    }
}

extension FlagsModel {
    func getFlag() throws {
        guard let url = Bundle.main.url(forResource: "Flags", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        
        let jsonDecoder = JSONDecoder()
        let dictionary = try jsonDecoder.decode([String: String].self, from: data)
        
        flags = dictionary.map { key, value in
            Flag(country: key, code: value)
        }
    }
}
