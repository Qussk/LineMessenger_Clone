//
//  LineMessengerCloneApp.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/11/24.
//

import SwiftUI


@main
struct LineMessengerCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate //UIKit의 앱딜이랑 이어주는 것.
    
    @StateObject var container: DIContainer = DIContainer(service: Services())
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init())
                .environmentObject(container)
            
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                break
            case .inactive:
                break
            case .background:
                break
            @unknown default:
                break
            }
        }
    }
}
