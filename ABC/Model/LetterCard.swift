//
//  LetterCard.swift
//  ABC
//
//  Created by Ольга on 13.06.2022.
//

import Foundation

struct LetterCard {
    
    let identifier: Int
    var letter: String
    var isVowel: Bool = true
    var words: [Word]
}
