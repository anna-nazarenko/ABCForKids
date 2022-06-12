//
//  ViewController.swift
//  ABC
//
//  Created by Ольга on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "LetterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as? LetterCollectionViewCell else {
            print("No cell")
            return UICollectionViewCell()
        }
        cell.backgroundColor  = .blue
        cell.letterLabel.text = "A"
        return cell
    }
}
