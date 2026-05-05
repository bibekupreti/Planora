//
//  ContentView.swift
//  Planora
//
//  Created by Bibek upreti on 05/05/2026.
//

import SwiftUI

struct ContentView: View {
    
    // Read AppCoordinator from the environment — injected in FocusRoomApp
    @Environment(AppCoordinator.self) private var coordinator
    
    var body: some View {
        // Switch on phase — show a different root view for each phase
        // This is the ONLY place that knows about all 4 phases
        switch coordinator.phase {
        case .prepare:
            Text("Prepare phase — coming Week 2")
        case .meet:
            Text("Meet phase — coming Week 5")
        case .recover:
            Text("Recover phase — coming Week 8")
        case .focus:
            Text("Focus phase — coming Week 9")
        }
    }
    
}
