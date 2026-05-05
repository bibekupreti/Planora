//
//  MeetingSummary.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public struct MeetingSummary: Codable, Sendable {
    public let meetingID: String
    public let decisions: [String]
    public let actionItems: [String]
    public let openQuestions: [String]
    public let oneLineSummary: String
    public let generatedAt: Date

    public init(meetingID: String, decisions: [String], actionItems: [String],
               openQuestions: [String], oneLineSummary: String, generatedAt: Date) {
        self.meetingID = meetingID
        self.decisions = decisions
        self.actionItems = actionItems
        self.openQuestions = openQuestions
        self.oneLineSummary = oneLineSummary
        self.generatedAt = generatedAt
    }
}
