//
//  AIError.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public enum AIError: LocalizedError, Sendable {
    case networkUnavailable
    case rateLimited(retryAfter: TimeInterval)
    case malformedResponse(raw: String)
    case maxRetriesExceeded

    public var errorDescription: String? {
        switch self {
        case .networkUnavailable:
            "No internet connection. Showing cached briefing."
        case .rateLimited(let seconds):
            "Too many requests. Retrying in \(Int(seconds)) seconds."
        case .malformedResponse:
            "AI returned an unexpected response. Trying again."
        case .maxRetriesExceeded:
            "Couldn't reach AI after 3 attempts. Check your connection."
        }
    }
}
