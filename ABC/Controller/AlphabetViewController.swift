//
//  ViewController.swift
//  ABC
//
//  Created by Friendly Family Studio on 11.06.2022.
//

import UIKit
import AVFoundation

class AlphabetViewController: UIViewController {
    
    //MARK: IBOutlets and IBActions
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: LetterCollectionViewCell.letterCellNibName, bundle: nil), forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = flowLayout
            collectionView.backgroundColor = .clear
//            dfkndfknvdkfn
//            rrgergergreg
        }
    }

    @IBOutlet weak var wordCardView: WordCardView! {
        didSet {
            wordCardView.isHidden = true
        }
    }
    
    @IBAction func didTapWordCardView(_ sender: UITapGestureRecognizer) {
        showLetterCardsCollectionView()
    }
    
    //MARK: Properties
    
    var alphabet: [LetterCard] = []
    let audioPlayer = AudioPlayer()
    
    let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        flowLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        return flowLayout
    }()
    
    let backgroundVideoPlayer: LoopedVideoPlayerView = {
        let path = Bundle.main.path(forResource: "background", ofType: ".mp4")!
        let backgroundVideoPlayer = LoopedVideoPlayerView()
        backgroundVideoPlayer.prepareVideo(URL(fileURLWithPath: path))
        backgroundVideoPlayer.playVideo()
        return backgroundVideoPlayer
    }()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabet = mockupData
        
        backgroundVideoPlayer.frame = view.bounds
        view.insertSubview(backgroundVideoPlayer, at: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    //MARK: Methods
    
    func showWordCardView() {
        wordCardView.isHidden = false
        collectionView.isHidden = true
    }
    
    func showLetterCardsCollectionView() {
        collectionView.isHidden = false
        wordCardView.isHidden = true
    }
    
    //MARK: Notification Center Methods
    
    @objc private func appMovedToBackground() {
        backgroundVideoPlayer.pauseVideo()
    }
    
    @objc private func appDidBecomeActive() {
        backgroundVideoPlayer.playVideo()
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
        cell.letterLabel.text = alphabet[indexPath.row].letter
        cell.setBackgroundColor(for: alphabet[indexPath.row].isVowel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showWordCardView()
        wordCardView.setBorderColor(for: alphabet[indexPath.row].isVowel)
        let words = mockupData[indexPath.row].words
        if let randomWord = words.randomElement() {
            wordCardView.wordImage.image = randomWord.image
            wordCardView.wordLabel.text = randomWord.word.uppercased()
            wordCardView.letterLabel.text = alphabet[indexPath.row].letter.uppercased()
            audioPlayer.playWordSound(for: randomWord)
        }
    }
}

//MARK: - Collection View Delegate Flow Layout

extension AlphabetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = collectionView.bounds.width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
    }
}
