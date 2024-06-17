//
//  LoginView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/17/24.
//

import SwiftUI

enum longinTitle: String {
    case google = "Google로 로그인"
    case apple = "Apple로 로그인"
}

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticatedViewModel
    
    var body: some View {
      
        VStack(alignment: .leading) {
            
            Group {
                Text("로그인")
                    .font(.system(size: 28))
                    .foregroundColor(.black)
                    .padding(.top, 80)
                
                Text("아래 제공되는 서비스로 로그인을 해주세요.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.grayDeep)
            }
            .padding(.horizontal, 30)

            
            Spacer()
            
            
            Button {
            //google
                authViewModel.send(action: .googleLogin)
                
            } label: {
                Text(longinTitle.google.rawValue)
            }.buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .grayLight))
                .padding(.horizontal, 15)
            
            
            Button {
            //apple
                
            } label: {
                Text(longinTitle.apple.rawValue)
            }.buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .grayLight))
                .padding(.horizontal, 15)

            
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("back")
                        }
                    }
                }
        }
    }
}

#Preview {
    LoginView()
}
