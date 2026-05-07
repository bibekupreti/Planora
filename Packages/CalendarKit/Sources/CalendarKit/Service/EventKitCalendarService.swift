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
    nonisolated(unsafe) private let store = EKEventStore() // Since EKEventStore is apple class written before Swift 6 strict concurrency. Apple hasn't marked it Sendable because it has internal mutable state - it's not thread safe by design hence we mark it as nonisolated unsafe which is generally used for stored properties on a type
    
    public init() {}
    
    // MARK: - Protocol Confirmation
    public func requestAuthorization() async throws {
        try await store.requestFullAccessToEvents()
        
        let status = EKEventStore.authorizationStatus(for: .event)
        
        switch status {
        case .fullAccess:
            return
        case .denied:
            throw CalendarError.authorizationDenied
        case .restricted:
            throw CalendarError.eventKitUnavailable
        default:
            throw CalendarError.authorizationDenied
        }
    }
    
    public func fetchUpcomingMeetings(limit: Int) async throws -> [PlanoraCore.Meeting] {
        // 1. Verify permission before touching store
        let status = EKEventStore.authorizationStatus(for: .event)
        guard status == .fullAccess else {
            throw CalendarError.authorizationDenied
        }
        // 2. Define the time window - now to 7 days ahead
        let now = Date()
        let weekAhead = Calendar.current.date(byAdding: .day, value: 7, to: now)!
        
        // 3. Build predicate
        let predicate = store.predicateForEvents(withStart: now,
                                                 end: weekAhead,
                                                 calendars: nil)
        
        // 4. Fetch and map EkEvent -> Meeting
        let meetings = store.events(matching: predicate)
            .prefix(limit)
            .map { ekEvent in
                Meeting(id: ekEvent.eventIdentifier,
                        title: ekEvent.title ?? "",
                        startDate: ekEvent.startDate,
                        endDate: ekEvent.endDate,
                        attendeeNames: ekEvent.attendees?.compactMap{ $0.name} ?? [],
                        notes: ekEvent.notes
                )
            }
        
        return Array(meetings)
    }
    
    public func meetingUpdates() -> AsyncStream<[PlanoraCore.Meeting]> {
        AsyncStream { continuation in
            // 1. Fetch immediately and yield first value
            Task {
                let meetings = try? await fetchUpcomingMeetings(limit: 20)
                continuation.yield(meetings ?? [])
            }
            
            // 2. Listen for calendar changes
            let observer = NotificationCenter.default.addObserver(forName: .EKEventStoreChanged,
                                                                  object: store,
                                                                  queue: .main) { [weak self] _ in
                guard let self = self else { return}
                Task {
                    let meetings = try? await self.fetchUpcomingMeetings(limit: 20)
                    continuation.yield(meetings ?? [])
                }
            }
            
            // 3. Clean up when stream is cancelled
            let observerBox = UncheckedSendable(observer)
            continuation.onTermination = { _ in
                NotificationCenter.default.removeObserver(observerBox)
            }
        }
    }
    
}
