//
//  Constants.swift
//  ABC
//
//  Created by Ольга on 24.07.2022.
//

import UIKit

struct Constants {
    enum Colors: String, CaseIterable {
        case blue = "Blue"
        case peach = "Peach"
        case pink = "Pink"
        case lightPink = "LightPink"

        static var allColors: [UIColor] {
            return self.allCases.compactMap{ (colorCase) -> UIColor? in return UIColor(named: colorCase.rawValue) }
        }
    }
}
