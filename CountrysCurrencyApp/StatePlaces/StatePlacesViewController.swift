//
//  StatePlacesViewController.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 14/06/24.
//

import UIKit

class StatePlacesViewController: UIViewController {
    @IBOutlet weak var placesTable: UITableView!
    
    var selectedState: String?
    var currentCountry: String?
    var estados: [Estado] = []
    var lugares: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedState
        placesTable.dataSource = self

        // Cargar datos JSON
        if let path = Bundle.main.path(forResource: "PointsOfInterest", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                if let paisesData = parseJSON(jsonData: data) {
                    cargarEstadosParaPais(paisesData: paisesData)
                    // Buscar lugares para el estado seleccionado
                    cargarLugaresParaEstado()
                    // Recargar la tabla con los datos
                    // tableView.reloadData()
                }
            } catch {
                print("Error al cargar el archivo JSON: \(error)")
            }
        }
        print(lugares)
    }

    func parseJSON(jsonData: Data) -> PaisesData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PaisesData.self, from: jsonData)
            return decodedData
        } catch {
            print("Error al decodificar el JSON: \(error)")
            return nil
        }
    }

    func cargarEstadosParaPais(paisesData: PaisesData) {
        guard let country = currentCountry else { return }
        
        switch country {
        case "Estados Unidos":
            estados = paisesData.Paises.first?.EstadosUnidos ?? []
        case "Canada":
            estados = paisesData.Paises.first?.Canada ?? []
        case "Mexico":
            estados = paisesData.Paises.first?.Mexico ?? []
        case "Brasil":
            estados = paisesData.Paises.first?.Brasil ?? []
        case "Argentina":
            estados = paisesData.Paises.first?.Argentina ?? []
        case "España":
            estados = paisesData.Paises.first?.España ?? []
        case "Francia":
            estados = paisesData.Paises.first?.Francia ?? []
        case "Alemania":
            estados = paisesData.Paises.first?.Alemania ?? []
        case "Japon":
            estados = paisesData.Paises.first?.Japon ?? []
        case "China":
            estados = paisesData.Paises.first?.China ?? []
        default:
            print("País no encontrado")
        }
    }

    func cargarLugaresParaEstado() {
        guard let state = selectedState else { return }
        
        if let estadoEncontrado = estados.first(where: { $0.estado == state }) {
            lugares = estadoEncontrado.lugares
        } else {
            print("Estado no encontrado")
        }
    }
}

extension StatePlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lugares.count
    }
    
    // aqui es donde creamos el tipo de celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }

        if #available(iOS 14, *) {
            var content = cell?.defaultContentConfiguration()
            content?.text = lugares[indexPath.row]
            cell?.contentConfiguration = content
        }
        
        return cell!
    }
}
