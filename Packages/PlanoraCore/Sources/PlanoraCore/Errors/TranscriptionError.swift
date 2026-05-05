//
//  TranscriptionError.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public enum TranscriptionError: LocalizedError, Sendable {
    case authorizationDenied
    case recognizerUnavailable
    case audioSessionFailed(underlying: Error)
    case recognitionFailed(underlying: Error)

    public var errorDescription: String? {
        switch self {
        case .authorizationDenied:
            "Microphone access denied. Enable it in Settings → FocusRoom."
        case .recognizerUnavailable:
            "Speech recognizer is not available. Check your language settings."
        case .audioSessionFailed(let e):
            "Audio error: \(e.localizedDescription)"
        case .recognitionFailed(let e):
            "Recognition failed: \(e.localizedDescription)"
        }
    }
}
