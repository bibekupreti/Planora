//
//  AIService.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public protocol AIService: Sendable {

    // Generate a pre-meeting briefing from the meeting + past summaries
    func generateBriefing(
        for meeting: Meeting,
        history: [MeetingSummary]
    ) async throws -> Briefing

    // Generate a post-meeting summary from the transcript
    func summarize(
        transcript: [TranscriptChunk],
        meeting: Meeting
    ) async throws -> MeetingSummary
}
