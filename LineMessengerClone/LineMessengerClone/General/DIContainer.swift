//
//  DIContainer.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/12/24.
//

import Foundation


class DIContainer: ObservableObject {
    //TODO: Service 
    var service: ServicesType
    
    init(service: ServicesType) {
        self.service = service
    }
    
    
}
