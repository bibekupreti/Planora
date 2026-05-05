//
//  PlanoraApp.swift
//  Planora
//
//  Created by Bibek upreti on 05/05/2026.
//

import SwiftUI

@main
struct PlanoraApp: App {
    
    // @State here means the App struct owns it for the full app lifetime
    @State private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(coordinator)
        }
    }
    
}
