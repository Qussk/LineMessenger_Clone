//
//  UserService.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/19/24.
//

import Foundation


protocol UserServiceType {
    
    
}

class UserService: UserServiceType {
    
    private var dbRepository: UserDBRepositoryType
    
    init(dbRepository: UserDBRepositoryType) {
        self.dbRepository = dbRepository
    }
}


class StubUserService: UserServiceType {
    
}
