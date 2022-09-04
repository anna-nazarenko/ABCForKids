//
//  WordCardView.swift
//  ABC
//
//  Created by Friendly Family Studio on 14.08.2022.
//

import UIKit

class WordCardView: UIView {
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: Outlets
    
    @IBOutlet var contentView: WordCardView!
    @IBOutlet weak var wordImage: UIImageView!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    //MARK: Methods
    
    private func commonInit() {
        Bundle.main.loadNibNamed("WordCardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 10
    }
    
    func setBorderColor(for isVowel: Bool) {
        if isVowel {
            contentView.layer.borderColor = Constants.Colors.lightPink?.cgColor
        } else {
            contentView.layer.borderColor = Constants.Colors.blue?.cgColor
        }
    }
}
