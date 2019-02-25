//
//  ObserverExampleViewController.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 25.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class ObserverExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let subject = Subject()
        
        let binary = BinaryObserver(subject: subject, id: 1)
        let octal = OctalObserver(subject: subject, id: 2)
        let hex = HexaObserver(subject: subject, id: 3)
        
        subject.number = 15
        subject.number = 2
    }

}
