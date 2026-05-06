//
//  TaskSyncService.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public protocol TaskSyncService: Sendable {
    // Push confirmed action items to Reminders / Todoist
    func push(actionItems: [ActionItem]) async throws
}
