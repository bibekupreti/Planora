//
//  FocusSession.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public struct FocusSession: Identifiable, Sendable {
    public let id: UUID
    public let startedAt: Date
    public var endedAt: Date?          // nil while session is running
    public var interruptionCount: Int  // incremented by InterruptionDetector
    public var qualityScore: Double?   // nil until session ends and is scored

    public init() {
        self.id = UUID()
        self.startedAt = Date()
        self.interruptionCount = 0
    }
}
