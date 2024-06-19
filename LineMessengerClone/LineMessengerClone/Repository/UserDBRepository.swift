//
//  UserDBRepository.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/19/24.
//

import Foundation
import Combine
import FirebaseDatabase


protocol UserDBRepositoryType {
    func addUser(_ object: UserObject) -> AnyPublisher<Void,DBError>
}


class UserDBRepository: UserDBRepositoryType {
    
    var db:DatabaseReference = Database.database().reference() //루트
    
    func addUser(_ object: UserObject) -> AnyPublisher<Void,DBError> {
        
        //object > data > dic
        Just(object)
            .compactMap { try? JSONEncoder().encode($0) }
            .compactMap { try? JSONSerialization.jsonObject(with:$0, options: .fragmentsAllowed) }
            .flatMap { value in
                Future<Void, Error> { [weak self] promise in
                    self?.db.child(DBKey.Users).child(object.id).setValue(value) { error, _ in
                        if let error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))

                        }
                    }
                }
            }
            .mapError { DBError.error($0) }
            .eraseToAnyPublisher()
    }

    
}
