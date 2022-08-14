//
//  WordCardView.swift
//  ABC
//
//  Created by Ольга on 14.08.2022.
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
    
    //MARK: Methods
    
    private func commonInit() {
        let bundle = Bundle.init(for: WordCardView.self)
        if let viewToAdd = bundle.loadNibNamed("WordCardView", owner: self),
           let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
