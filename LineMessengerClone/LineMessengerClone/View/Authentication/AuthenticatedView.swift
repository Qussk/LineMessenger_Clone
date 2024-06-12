//
//  AuthenticatedView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/11/24.
//

import SwiftUI
  //test
struct AuthenticatedView: View {
    @StateObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init())
}
