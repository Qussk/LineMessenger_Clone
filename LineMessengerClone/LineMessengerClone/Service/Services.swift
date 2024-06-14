//
//  Services.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/12/24.
//

import Foundation


protocol ServicesType {
    var authService: AuthenticationServiceType { get set }
}

class Services: ServicesType {
    var authService: AuthenticationServiceType
    

    init() {
        self.authService = AuthenticationService()
    }
    
}


class StubServices: ServicesType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    
}
