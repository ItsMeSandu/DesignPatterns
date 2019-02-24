//
//  ColourPalette .swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class ColourPalette {
    
    // MARK: - define as a singleton
    private init() {}

    static let shared = ColourPalette()

    // MARK: - helper
    let background: UIColor     = .white
    let primaryColour: UIColor  = .black
    let secondaryColou: UIColor = .red
}
