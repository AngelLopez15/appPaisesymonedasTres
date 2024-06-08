//
//  CountriesDetailModelViewController.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//

import UIKit

class CountriesDetailModelViewController: UIViewController {
    var country = ""
    
    private var countriesDetailModel = CountriesDetailModel()
        private var filteredDetails: CountriesDetail?
        
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var capitalLabel: UILabel!
        @IBOutlet weak var idiomaLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = country
            
            do {
                try countriesDetailModel.getCountriesDetail()
                filteredDetails = countriesDetailModel.countriesDetails?.first { $0.nombre == country }
                print(filteredDetails)
                //updateUI()
            } catch {
                print("Error loading country details: \(error)")
            }
        }
        
//        private func updateUI() {
//            guard let details = filteredDetails else { return }
//            nameLabel.text = details.nombre
//            capitalLabel.text = details.capital
//            idiomaLabel.text = details.idioma
//        }
}
