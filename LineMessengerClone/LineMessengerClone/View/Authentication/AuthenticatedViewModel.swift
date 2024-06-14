//
//  AuthenticatedViewModel.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/12/24.
//

import Foundation

enum AuthenticationState {
    case unauthenticated
    case authenticated
}

class AuthenticatedViewModel: ObservableObject {
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
        
       // container.service.authService
    }
    
    
}
