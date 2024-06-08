//
//  CountriesDetailModel.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class CountriesDetailModel {
    var countriesDetails: [CountriesDetail]?
    
    func post(for index: Int) -> CountriesDetail? {
        countriesDetails?[index]
    }
    
    func getCountriesDetails() -> Int {
        countriesDetails?.count ?? 0
    }
}

extension CountriesDetailModel {
    func getCountriesDetail() throws {
        guard let url = Bundle.main.url(forResource: "CountriesDetails", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        let countriesDetailsDTOs = try [CountriesDetailsDTO](data: data)
        countriesDetails = countriesDetailsDTOs.enumerated().map({ (index, countriesDetail) in
            CountriesDetail(nombre: countriesDetail.nombre, capital: countriesDetail.capital, idioma: countriesDetail.idioma)
        })
    }
}
