//
//  LoginIntroView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/14/24.
//

import SwiftUI

struct LoginIntroView: View {
    
    @State private var isPresentedLoginView = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Spacer()
                
                Text("환영합니다.")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.black)
                
                Text("무료 메세지놔 영상통화, 음성통화를 부담없이 누려보세요!")
                    .font(.system(size:12))
                    .foregroundColor(Color.grayDeep1)
                
                
                Spacer()
                
                Button {
                    isPresentedLoginView.toggle()
                } label: {
                    Text("로그인")
                }.buttonStyle(LoginButtonStyle(textColor: .lineAppColor))
                
                .navigationDestination(isPresented: $isPresentedLoginView) {
                    LoginView()
                }
                
            }
        }
    }
}

#Preview {
    LoginIntroView()
}
