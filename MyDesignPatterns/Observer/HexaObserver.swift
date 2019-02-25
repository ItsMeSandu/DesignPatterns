//
//  HexaObserver.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 25.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation

class HexaObserver : Observer{
    
    private var subject = Subject()
    var id = Int()
    
    init(subject : Subject, id : Int) {
        self.subject = subject
        self.subject.attachObserver(observer: self)
        self.id = id
    }
    
    func update(){
        print("Hex: \(String(subject.number, radix: 16))")
    }
    
}
