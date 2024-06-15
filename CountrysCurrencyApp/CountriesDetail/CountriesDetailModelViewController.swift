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
    private var flagsModel = FlagsModel()
    private var monedaModel = MonedaModel()
    private var capitalsModel = CapitalModel()
    
    private var filteredDetails: CountriesDetail?
    private var filteredFlags: Flag?
    private var filteredCurrency: Moneda?
    private var filteredCapitals: [String] = []
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var idiomaLabel: UILabel!
    @IBOutlet weak var flagOfCountry: UIImageView!
    @IBOutlet weak var statesTable: UITableView!
    @IBOutlet weak var currencyCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = country
        
        statesTable.dataSource = self
        statesTable.delegate = self
        
        // Añadir UITapGestureRecognizer al currencyCountry label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(currencyCountryTapped))
        currencyCountry.isUserInteractionEnabled = true
        currencyCountry.addGestureRecognizer(tapGesture)

        do {
            try countriesDetailModel.getCountriesDetail()
            try flagsModel.getFlag()
            try monedaModel.getMoneda()
            try capitalsModel.getCapi(pais: country)
            
            filteredDetails = countriesDetailModel.countriesDetails?.first { $0.nombre == country }
            filteredFlags = flagsModel.flags.first { $0.country == country }
            filteredCurrency = monedaModel.monedas?.first { $0.nombre == country }
            filteredCapitals = capitalsModel.estados ?? []
            
            updateUI()
        } catch {
            print("Error loading country details: \(error)")
        }
    }
        
    private func updateUI() {
        guard let details = filteredDetails else { return }
        guard let flagImagen = filteredFlags else { return }
        guard let monedaPais = filteredCurrency else { return }
        nameLabel.text = details.nombre
        capitalLabel.text = details.capital
        idiomaLabel.text = details.idioma
        currencyCountry.text = monedaPais.moneda
        flagOfCountry.image = UIImage(named: "\(flagImagen.code).png")
    }
    
    // Acción que se ejecuta cuando se toca el label currencyCountry
       @objc func currencyCountryTapped() {
           // Cambiar a la segunda pestaña
           if let tabBarController = self.tabBarController {
               tabBarController.selectedIndex = 1 // Cambia el índice a la pestaña deseada (segunda pestaña tiene índice 1)
           }
       }
}

extension CountriesDetailModelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCapitals.count
    }
    
    // aqui es donde creamos el tipo de celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }

        if #available(iOS 14, *) {
            var content = cell?.defaultContentConfiguration()
            content?.text = filteredCapitals[indexPath.row]
            cell?.contentConfiguration = content
        }
        
        return cell!
    }
}

extension CountriesDetailModelViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedState = filteredCapitals[indexPath.row]
        let statePlacesViewController = StatePlacesViewController(nibName: "StatePlacesViewController", bundle: nil)
        statePlacesViewController.selectedState = selectedState
        statePlacesViewController.currentCountry = country
        navigationController?.pushViewController(statePlacesViewController, animated: true)
    }
}
