//
//  AuthenticatedView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/11/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @StateObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
        switch authViewModel.authenticationState {
        case .unauthenticated:
            //TODO: LoginView
          
            LoginIntroView()
            
        case .authenticated:
            //TODO: MainTabView
            
            MainTabView()
        }
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init(container: .init(service: StubServices())))
}
