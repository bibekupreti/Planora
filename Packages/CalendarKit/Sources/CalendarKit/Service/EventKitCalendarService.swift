//
//  EventKitCalendarService.swift
//  CalendarKit
//
//  Created by Bibek upreti on 06/05/2026.
//

import EventKit
import PlanoraCore

public final class EventKitCalendarService: CalendarService {
    
    // MARK: - Properties
    nonisolated(unsafe) private let store = EKEventStore() // Since EKEventStore isapple class written before Swift 6 strict concurrency. Apple hasn't marked it Sendable because it has internal mutable state - it's not thread safe by design
    
    // MARK: - Protocol Confirmation
    public func requestAuthorization() async throws {
        if #available(iOS 17.0, *) {
            try await store.requestFullAccessToEvents()
        } else {
            try await store.requestAccess(to: .event)
        }
    }
    
    public func fetchUpcomingMeetings(limit: Int) async throws -> [PlanoraCore.Meeting] {
        <#code#>
    }
    
    public func meetingUpdates() -> AsyncStream<[PlanoraCore.Meeting]> {
        <#code#>
    }
    
    
}
