//
//  MainTabView.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/14/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTabType = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                switch tab {
                    case .home:
                        HomeView()
                    case .chat:
                        ChatListView()
                    case .phone:
                        Color.bk2Fix1
                    }
                }
                .tabItem {
                    Label(tab.title, image: tab.imageName(selected: selectedTab == tab))
                }
                .tag(tab)
            }
        }
        .tint(.bkText1)
    }
    
    init () {
       // UITabBar.
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.bkText1)
    }

}

#Preview {
    MainTabView()
}
