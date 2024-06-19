//
//  UserObject.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/19/24.
//

import Foundation


struct UserObject: Codable {
    var id: String
    var name: String
    var phoneNumber: String?
    var profileURL: String?
    var description: String?
}

