//
//  Adapter.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 14.03.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation


// MARK: - simple adapter
class Hobbit {
    func walk() {
        print("Hobbit is walking few steps")
    }
}
protocol GuardianOfCitadelProtocol {
    func march()
}

extension Hobbit: GuardianOfCitadelProtocol {
    func march() {
        walk()
    }
}

// MARK: - object adapter
class GuardianOfTheCitadel {
    func march() {
        print("Guardian is marching, with his head up")
    }
}

class HobbitGuardian: GuardianOfTheCitadel {
    private var hobbit: Hobbit
    
    init(hobbit: Hobbit) {
        self.hobbit = hobbit
    }
    
    override func march() {
        hobbit.walk()
    }
}
