//UserAuth.swift created on 28/06/2020.

import Foundation
import Combine

class UserAuth: ObservableObject {

    let didChange = PassthroughSubject<UserAuth,Never>()
    
    let willChange = PassthroughSubject<UserAuth,Never>()

    func login() {
        self.isLoggedin = true
    }
      
    func logout() {
        self.isLoggedin = false
    }
        
    func setUserID(userID: Int) {
        self.userID = userID
    }
        
    @Published var userID = -1
    @Published var isLoggedin = false {
        didSet {
            didChange.send(self)
        }

        willSet {
            willChange.send(self)
        }
    }
}
