//
//  ViewController.swift
//  CountrysCurrencyApp
//
//  Created by Angel Octavio Lopez Cruz on 08/06/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let array = ["Buscando a nemo","Annabelle","Barbie","El rey leon", "El padrino", "Star Wars", "Spiderman","Harry Potter", "Eso" , "Yo antes de ti"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.dataSource = self
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        collectionView.delegate = self
    }
}

//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        array.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // no existen celdas prototipos
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
//        
//        cell.setup(name: array[indexPath.row])
//        
//        return cell
//    }
//}
//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 150, height: 250)
//    }
//}

//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(array[indexPath.row])
//    }
//}
