//
//  CambioViewController.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 14/06/24.
//

import UIKit

class CambioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerOne: UIPickerView!
    @IBOutlet weak var pickerTwo: UIPickerView!
    @IBOutlet weak var buttonChange: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var buttonConvertir: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    
    var monedas: [String] = []
    var exchangeRates: [String: [String: Double]] = [:]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            pickerOne.delegate = self
            pickerOne.dataSource = self
            pickerTwo.delegate = self
            pickerTwo.dataSource = self
            
            cargarDatos()
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return monedas.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return monedas[row]
        }
        
        @IBAction func intercambiarValores(_ sender: UIButton) {
            let selectedRowOne = pickerOne.selectedRow(inComponent: 0)
            let selectedRowTwo = pickerTwo.selectedRow(inComponent: 0)
            printContent("Entro ala funcion")
            pickerOne.selectRow(selectedRowTwo, inComponent: 0, animated: true)
            pickerTwo.selectRow(selectedRowOne, inComponent: 0, animated: true)
        }
    
    @IBAction func convertirMoneda(_ sender: UIButton) {
        guard let cantidadText = inputTextField.text, let cantidad = Double(cantidadText) else {
            labelResult.text = "Por favor, ingrese una cantidad válida."
            return
        }
        
        let selectedRowOne = pickerOne.selectedRow(inComponent: 0)
        let selectedRowTwo = pickerTwo.selectedRow(inComponent: 0)
        
        let monedaOrigen = monedas[selectedRowOne]
        let monedaDestino = monedas[selectedRowTwo]
        
        if let tasaCambio = exchangeRates[monedaOrigen]?[monedaDestino] {
            let resultado = cantidad * tasaCambio
            labelResult.text = String(format: "%.2f", resultado)
        } else {
            labelResult.text = "No se encontró la tasa de cambio."
        }
    }

    func cargarDatos() {
        if let path = Bundle.main.path(forResource: "CurrencyConversion", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [Dictionary<String, AnyObject>]
                
                jsonResult?.forEach { dict in
                    for (key, value) in dict {
                        if let innerDict = value as? [String: Double] {
                            exchangeRates[key] = innerDict
                        }
                    }
                }
                
                monedas = Array(exchangeRates.keys).sorted()
                pickerOne.reloadAllComponents()
                pickerTwo.reloadAllComponents()
            } catch {
                print("Error al cargar el JSON")
            }
        }
    }

}
