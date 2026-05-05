//
//  AppCoordinator.swift
//  Planora
//
//  Created by Bibek upreti on 05/05/2026.
//

import SwiftUI

enum AppPhase {
    case prepare
    case meet
    case recover
    case focus
}

@Observable
final class AppCoordinator {
    
    var phase: AppPhase = .prepare
    
    func startMeeting() {
        phase = .meet
    }
    
    func endMeeting() {
        phase = .recover
    }
    
    func finishReview() {
        phase = .focus
    }
    
    func endFocusSession() {
        phase = .prepare
    }
    
    
}
