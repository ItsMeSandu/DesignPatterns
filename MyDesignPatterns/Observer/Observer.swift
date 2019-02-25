//
//  Observer.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 25.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation

protocol Observer {
    var id: Int { get }
    func update()
}
