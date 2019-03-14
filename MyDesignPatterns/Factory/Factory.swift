//
//  Factory.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 14.03.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation

protocol JobContactProtocol {
    var contact: Contact { get set }
    func sendRequestResumeEmail() -> String
}

struct Contact {
    var name: String
    var email: String
    var job: Job
    var desiredSal: Double
    
    enum Job {
        case iOS, android, web, qa, productOwner
    }
}

struct iOSDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), this is the best time to be an iOS developer!"
    }
}

struct AndroidDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), this is the best time to be an Android developer!"
    }
}

struct WebDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), this is the best time to be an Web developer!"
    }
}

struct QADeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), the market is tough but the code is still buggy!"
    }
}

struct ProductOwnerDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), if we can cut your desired salary of \(contact.desiredSal) in half, I should be able to place you as a contract to hire"
    }
}

struct JobContracterFactory {
    static func getJobSeeker(contact: Contact) -> JobContactProtocol {
        switch contact.job {
        case .iOS:
            return iOSDeveloperJobSeeker(contact: contact)
        case .android:
            return AndroidDeveloperJobSeeker(contact: contact)
        case .web:
            return WebDeveloperJobSeeker(contact: contact)
        case .qa:
            return QADeveloperJobSeeker(contact: contact)
        case .productOwner:
            return ProductOwnerDeveloperJobSeeker(contact: contact)
        }
    }
}
