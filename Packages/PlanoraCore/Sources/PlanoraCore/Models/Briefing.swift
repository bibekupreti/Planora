//
//  Briefing.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

// Codable because this is decoded from Claude API's JSON response
public struct Briefing: Codable, Sendable {
    public let meetingID: String
    public let know: [String]       // 3 things to know going into the meeting
    public let questions: [String]  // 2 good questions to consider asking
    public let decision: String     // 1 likely decision to be made
    public let generatedAt: Date

    public init(meetingID: String, know: [String],
               questions: [String], decision: String, generatedAt: Date) {
        self.meetingID = meetingID
        self.know = know
        self.questions = questions
        self.decision = decision
        self.generatedAt = generatedAt
    }
}
