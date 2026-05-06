//
//  CalendarService.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public protocol CalendarService: Sendable {
    // Ask the user for calendar permission
    func requestAuthorization() async throws

    // Get the next N meetings from now
    func fetchUpcomingMeetings(limit: Int) async throws -> [Meeting]

    // Observe calendar changes — yields a new array whenever calendar updates
    func meetingUpdates() -> AsyncStream<[Meeting]>
}
