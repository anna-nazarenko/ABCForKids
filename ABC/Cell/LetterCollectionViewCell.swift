//
//  LetterCollectionViewCell.swift
//  ABC
//
//  Created by Ольга on 11.06.2022.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var letterLabel: UILabel!
    
    static let identifier = "letterCell"
    static let letterCellNibName = "LetterCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func select() {
        let cellView = UIView(frame: bounds)
        cellView.backgroundColor = .green
        self.selectedBackgroundView = cellView
        letterLabel.text = "✔️"
    }

}
