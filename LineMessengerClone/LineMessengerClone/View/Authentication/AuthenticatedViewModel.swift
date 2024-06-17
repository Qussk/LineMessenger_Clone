//
//  AuthenticatedViewModel.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/12/24.
//

import Foundation
import Combine

enum AuthenticationState {
    case unauthenticated
    case authenticated
}

class AuthenticatedViewModel: ObservableObject {
    enum Action {
        case googleLogin
        case appleLogin
    }
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    var userId: String?
    
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
        
    }

    func send(action: Action) {
        switch action {
        case .googleLogin :
            
            container.service.authService.signInWithGoogle()
                .sink { compltion in
                    //실패
                    
                } receiveValue: { [weak self] user in
                    self?.userId = user.id
                    
                }.store(in: &subscriptions)

            
            
            
            break
        case .appleLogin :
            break
        }
    }
    
}
