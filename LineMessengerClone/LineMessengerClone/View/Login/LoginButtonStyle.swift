//
//  LoginButtonStyle.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/17/24.
//

import SwiftUI

struct LoginButtonStyle: ButtonStyle {
    let textColor:Color
    let borderColor:Color
    
    init(textColor:Color, borderColor: Color? = nil) {
        //borderColor를 옵셔널로 한 이유는 테두리는 같고 텍스트 컬러만 다를경우를 대비
        self.textColor = textColor
        self.borderColor = borderColor ?? textColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, maxHeight: 40)
            
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(borderColor ,lineWidth: 0.8)
            }
            .padding(.horizontal, 15)
            .opacity(configuration.isPressed ? 0.5 : 1) //
            //configuration.isPressed //토글같은거
    }
}


/*
 Button {
     isPresentedLoginView.toggle()
 } label: {
     Text("로그인")
         .font(.system(size: 14))
         .foregroundColor(Color.lineAppColor)
         .frame(maxWidth: .infinity, maxHeight: 40)
     
 }
 .overlay {
     RoundedRectangle(cornerRadius: 5)
         .stroke( Color.lineAppColor ,lineWidth: 0.8)
 }
 .padding(.horizontal, 15)

 */
