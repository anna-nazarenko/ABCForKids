//
//  ViewController.swift
//  ABC
//
//  Created by Ольга on 11.06.2022.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer?

class AlphabetViewController: UIViewController {
    
    //MARK: Outlets

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: LetterCollectionViewCell.letterCellNibName, bundle: nil), forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    @IBOutlet weak var letterFullScreenImageButton: UIButton!

    @IBAction func touchLetterFullScreenImage(_ sender: UIButton) {
        let numberOfWords = mockupData[currentLetterIndex].words.count - 1
        let wordIndex = tapCount(numberOfWords: numberOfWords)
        if wordIndex <= numberOfWords {
            letterFullScreenImageButton.setImage(alphabet[currentLetterIndex].words[wordIndex].image, for: .normal)
        } else {
            letterFullScreenImageButton.isHidden = true
            collectionView.isHidden = false
            tapCounter = 0
        }
    }
    
    //MARK: Properties
    
    var alphabet: [LetterCard] = []
    var currentLetterIndex: Int = 0
    var tapCounter: Int = 0
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabet = mockupData
        letterFullScreenImageButton.isHidden = true
        collectionView.isHidden = false
    }
    
    //MARK: Methods
    
    func playSound(letterIndex: Int) {
        let soundName = mockupData[letterIndex].words[0].sound
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func tapCount(numberOfWords: Int) -> Int {
        tapCounter += 1
        return tapCounter
    }
    
}

//MARK: - Collection View Delegate/DataSource

extension AlphabetViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alphabet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as? LetterCollectionViewCell else {
            print("No cell")
            return UICollectionViewCell()
        }
        cell.backgroundColor  = .lightGray
        cell.letterLabel.text = alphabet[indexPath.row].letter
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentLetterIndex = indexPath.row
        letterFullScreenImageButton.isHidden = false
        collectionView.isHidden = true
        playSound(letterIndex: indexPath.row)
        for index in alphabet[indexPath.row].words.indices {
            letterFullScreenImageButton.setImage(alphabet[indexPath.row].words[index].image, for: .normal)
            break
        }
    }
}

//MARK: - Collection View Delegate Flow Layout

extension AlphabetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.bounds.width
            let numberOfItemsPerRow: CGFloat = 2
            let spacing: CGFloat = flowLayout.minimumInteritemSpacing
            let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
            let itemDimension = floor(availableWidth / numberOfItemsPerRow)
            return CGSize(width: itemDimension, height: itemDimension)
        }
}
