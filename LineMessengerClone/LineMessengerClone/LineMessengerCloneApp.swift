//
//  LineMessengerCloneApp.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/11/24.
//

import SwiftUI


@main
struct LineMessengerCloneApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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
