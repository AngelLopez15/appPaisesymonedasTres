//
//  StatePlacesViewController.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 14/06/24.
//

import UIKit

class StatePlacesViewController: UIViewController {
    var selectedState: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedState
        print("Selected state: \(selectedState ?? "None")")
    }
}
