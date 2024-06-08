//
//  ViewController.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 08/06/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var flagsModel = FlagsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        do {
            try flagsModel.getFlag()
            collectionView.reloadData()
        } catch {
            print("Error loading flags: \(error)")
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flagsModel.getFlags()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCountry", for: indexPath) as! CustomCollectionViewCell
        if let flag = flagsModel.flag(for: indexPath.row) {
            cell.setup(countryName: flag.country, code: flag.code)
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let flag = flagsModel.flag(for: indexPath.row) {
            print("Selected country: \(flag.country)")
            let selectedCountry = flag.country
            let countriesDetailModelViewController = CountriesDetailModelViewController(nibName: "CountriesDetailModelViewController", bundle: nil)
            countriesDetailModelViewController.country = selectedCountry
            navigationController?.pushViewController(countriesDetailModelViewController, animated: true)
        }
    }
}
