//
//  HomeView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/18/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                profileView
                    .padding(.bottom, 30)
                
                searchButtonView
                    .padding(.bottom, 20)
                
                HStack {
                    Text("친구")
                        .font(.system(size: 16))
                        .foregroundColor(.bkText1)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                
                if viewModel.users.isEmpty {
                    Spacer(minLength: 89)
                    
                    emptyView
                    
                } else {
                    usersView
                    
                }
                
            }
            .toolbar {
                Image("bookmark")
                Image("notifications")
                Image("person_add")
                Button {
                    
                }label: {
                    Image("settings")
                }
            }
        }
    }
    
    //상단 프로필
    var profileView: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 7) {
                Text(viewModel.myUser?.name ?? "이름")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.bkText1)
                Text(viewModel.myUser?.description ?? "상태 메세지 입력")
                    .font(.system(size: 12))
                    .foregroundColor(.grayDeep1)
                
            }
            
            Spacer()
            
            Image("profile-img")
                .resizable()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
            
        }.padding(.horizontal, 30)
    }
    
    //검색바
    var searchButtonView: some View {
        ZStack {
            Rectangle()
                .frame(height: 36)
                .foregroundColor(.clear)
                .background(Color.grayCool1)
                .cornerRadius(5)
            
            HStack {
                Text("검색")
                    .frame(height: 30)
                    .font(.system(size: 12))
                    .foregroundColor(.grayLightver2)
                
                Spacer()
                
            }.padding(.leading, 22)
            
        }.padding(.horizontal, 30)
    }
    
    //친구없을떄
    var emptyView: some View {
        VStack {
            
            Text("친구를 추가해 보세요.")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.bkText1)
            Text("큐알코드나 검색을 이용해서 친구를 추가해보세요.")
                .font(.system(size: 14))
                .foregroundColor(.grayDeep1)
                .padding(.bottom, 30)
            
            Button {
                
                
            } label: {
                Text("친구추가")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.bkText1)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 24)
                
            }
            .overlay {
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.grayLight)
            }
            
        }
        
    }
    
    //친구있을때
    var usersView: some View {
        ForEach (viewModel.users, id: \.id) { user in
            
            HStack(spacing: 8) {
                Image("profile-img")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(user.name)
                    .foregroundColor(.bkText)
                    .font(.system(size: 12))
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
        }
    }
    
}

#Preview {
    HomeView(viewModel: .init())
}
