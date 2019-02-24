//
//  DependencyInjection.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import Foundation

class User {
    private var loggedIn = false
    
    func isUserLogedIn() -> Bool {
        return loggedIn
    }
    
    func showLoginScreen() {
        // forward to the login screen
    }
}

class DependencyInjection {
    init(user: User) {
        guard user.isUserLogedIn() else {
            user.showLoginScreen()

            return
        }
    }
    
    func showProfile(){
        // this only ca be accessed if the user is logged in
    }
}
