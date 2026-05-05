//
//  CalendarError.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public enum CalendarError: LocalizedError, Sendable {
    case authorizationDenied
    case fetchFailed(underlying: Error)
    case eventKitUnavailable

    public var errorDescription: String? {
        switch self {
        case .authorizationDenied:
            "Calendar access denied. Enable it in Settings → FocusRoom."
        case .fetchFailed(let e):
            "Couldn't load meetings: \(e.localizedDescription)"
        case .eventKitUnavailable:
            "Calendar is not available on this device."
        }
    }
}
