//
//  Services.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/12/24.
//

import Foundation


protocol ServicesType {
    var authService: AuthenticationServiceType { get set }
    var userService: UserServiceType { get set }

}

class Services: ServicesType {
    var authService: AuthenticationServiceType
    var userService: UserServiceType


    init() {
        self.authService = AuthenticationService()
        self.userService = UserService(dbRepository: UserDBRepository())
    }
    
}


class StubServices: ServicesType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService: UserServiceType = StubUserService()
    
}
