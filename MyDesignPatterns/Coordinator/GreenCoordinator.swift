//
//  GreenCoordinator.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class GreenCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var children = [Coordinator]()
    var nav: UINavigationController
    
    init(nav controller: UINavigationController) {
        self.nav = controller
    }

    func start() {
        let vc = GreenViewController()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    
}
