//
//  CustomCollectionViewCell.swift
//  CountrysCurrencyApp
//
//  Created by Diplomado on 08/06/24.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
        
    public func setup(countryName: String, code: String?) {
        if code != nil {
            imageView.image = UIImage(named: "\(code!).png")
        }
        label.text = countryName
    }
}
