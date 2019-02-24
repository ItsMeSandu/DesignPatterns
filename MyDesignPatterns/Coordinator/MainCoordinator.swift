//
//  Coordinator.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: NSObject, Coordinator {
    var children = [Coordinator]()
    var nav: UINavigationController

    init(navigationCtrl: UINavigationController) {
        self.nav = navigationCtrl
    }
    
    func start() {
        nav.delegate    = self
        let vc = ViewController.instantiate()
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }

    func goGreen() {
        let child = GreenCoordinator(nav: nav)
        children.append(child)
        child.parentCoordinator = self
        child.start()
    }

    func goRed() {
        let child = RedCoordinator(nav: nav)
        children.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromVC) {
            return
        }

        if let greenVC = fromVC as? GreenViewController {
            childDidFinish(greenVC.coordinator)
        }

        if let redVC = fromVC as? RedViewController {
            childDidFinish(redVC.coordinator)
        }
    }
}

