//
//  MockupData.swift
//  ABC
//
//  Created by Dream Store on 25.06.2022.
//

import Foundation
import UIKit

let mockupData = [
    LetterCard(identifier: 1, letter: "A", words: [
        Word(word: "Арбуз", image: UIImage(systemName: "leaf.circle")!),
        Word(word: "Абрикос", image: UIImage(systemName: "ladybug.fill")!),
        Word(word: "Акула", image: UIImage(systemName: "flame")!),
    ]),
    LetterCard(identifier: 2, letter: "Б", words: [
        Word(word: "Бочка", image: UIImage(systemName: "leaf.circle")!),
        Word(word: "Бинокль", image: UIImage(systemName: "leaf.circle")!),
        Word(word: "Бобы", image: UIImage(systemName: "leaf.circle")!),
    ]),
    LetterCard(identifier: 3, letter: "В", words: [
        Word(word: "Волк", image: UIImage(systemName: "leaf.circle")!),
        Word(word: "Винигрет", image: UIImage(systemName: "ladybug.fill")!),
        Word(word: "Ворон", image: UIImage(systemName: "flame")!),
    ]),
]
