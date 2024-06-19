//
//  HomeViewModel.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/19/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var myUser: User?
//    @Published var users: [User] = []
    @Published var users: [User] = [stub1, stub2]

}


extension HomeViewModel {
    static var stub1: User {
        .init(id: "user1_id", name: "서영아")
    }
    static var stub2: User {
        .init(id: "user2_id", name: "신동윤")
    }
}
