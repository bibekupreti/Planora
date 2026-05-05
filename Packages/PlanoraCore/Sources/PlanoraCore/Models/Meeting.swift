//
//  Meeting.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

// public = visible to every package that imports FocusCore
// Sendable = safe to pass across actor boundaries (required for Swift 6)
public struct Meeting: Identifiable, Hashable, Sendable {
    public let id: String
    public let title: String
    public let startDate: Date
    public let endDate: Date
    public let attendeeNames: [String]
    public let notes: String?

    // Computed — no stored state, always derived from startDate/endDate
    public var duration: Int {
        Int(endDate.timeIntervalSince(startDate) / 60)
    }

    public init(
        id: String,
        title: String,
        startDate: Date,
        endDate: Date,
        attendeeNames: [String],
        notes: String? = nil
    ) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.attendeeNames = attendeeNames
        self.notes = notes
    }
}
