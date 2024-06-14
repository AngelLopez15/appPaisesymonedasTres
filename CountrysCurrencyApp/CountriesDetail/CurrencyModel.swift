//
//  CurrencyModel.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 14/06/24.
//

import UIKit

class MonedaModel {
    var monedas: [Moneda]?
    
    func post(for index: Int) -> Moneda? {
        monedas?[index]
    }
    
    func getMonedas() -> Int {
        monedas?.count ?? 0
    }
}

extension MonedaModel {
    func getMoneda() throws {
        guard let url = Bundle.main.url(forResource: "Currency", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        let currenciesDTOs = try [MonedaDTO](data: data)
        monedas = currenciesDTOs.enumerated().map({ (index, correncies) in
            Moneda(nombre: correncies.nombre, moneda: correncies.moneda)
        })
    }
}
