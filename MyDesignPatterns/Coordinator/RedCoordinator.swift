//
//  RedCoordinator.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class RedCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var children = [Coordinator]()
    var nav: UINavigationController
    
    init(nav controller: UINavigationController) {
        self.nav = controller
    }
    
    func start() {
        let vc = RedViewController()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
}
