//
//  FactoryExample.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 14.03.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation

class FactoryExample {
    init() {
        doExample()
    }
    
    private func doExample() {
        var contacts = [Contact]()
        contacts.append(Contact(name: "Example1", email: "example1@example.com", job: .iOS, desiredSal: 130000))
        contacts.append(Contact(name: "Example2", email: "example2@example.com", job: .android, desiredSal: 130000))
        contacts.append(Contact(name: "Example3", email: "example3@example.com", job: .web, desiredSal: 130000))
        contacts.append(Contact(name: "Example4", email: "example4@example.com", job: .qa, desiredSal: 100000))
        contacts.append(Contact(name: "Example5", email: "example5@example.com", job: .productOwner, desiredSal: 150000))
        
        for contact in contacts {
            let client = JobContracterFactory.getJobSeeker(contact: contact)
            print(client.sendRequestResumeEmail())
        }
    }
}
