//
//  ObserverExampleViewController.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 25.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class ObserverExampleViewController: UIViewController {
    let subject = Subject()

    lazy var binary = BinaryObserver(subject: subject, id: 1)
    lazy var octal = OctalObserver(subject: subject, id: 2)
    lazy var hex = HexaObserver(subject: subject, id: 3)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        subject.number = 15
        subject.number = 2
    }
    
    deinit {
        subject.removeObserver(observer: binary)
        subject.removeObserver(observer: octal)
        subject.removeObserver(observer: hex)
    }
}
