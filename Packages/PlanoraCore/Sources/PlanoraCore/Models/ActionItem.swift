//
//  ActionItem.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public struct ActionItem: Identifiable, Sendable {
    public let id: UUID
    public let text: String
    public let speaker: String?
    public let confidence: Double   // 0.0–1.0 — how sure we are this is an action item
    public var isConfirmed: Bool    // var — user confirms/rejects in Recover phase

    public init(text: String, speaker: String?, confidence: Double) {
        self.id = UUID()
        self.text = text
        self.speaker = speaker
        self.confidence = confidence
        self.isConfirmed = false     // always starts unconfirmed
    }
}
