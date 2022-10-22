//
//  LetterCollectionViewCell.swift
//  ABC
//
//  Created by Family Studio on 11.06.2022.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var letterLabel: UILabel!
    
    static let identifier = "letterCell"
    static let letterCellNibName = "LetterCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 20
        contentView.layer.cornerRadius = 8
    }
    
    func setBackgroundColor(for isVowel: Bool) {
        if isVowel {
            backgroundColor = Constants.Colors.lightPink
        } else {
            backgroundColor = Constants.Colors.blue
        }
    }
}
