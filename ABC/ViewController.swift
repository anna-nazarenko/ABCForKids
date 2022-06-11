//
//  ViewController.swift
//  ABC
//
//  Created by Ольга on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: "letterCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as? LetterCollectionViewCell else {
            print("No cell")
            return UICollectionViewCell()
        }
        cell.backgroundColor  = .blue
 //       cell.letterLabel.text = "A"
        return cell
    }
}
