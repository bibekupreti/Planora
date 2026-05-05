//
//  File.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public struct TranscriptChunk: Identifiable, Sendable {
    public let id: UUID          // auto-generated, unique per chunk
    public let text: String       // the words recognized so far
    public let isFinal: Bool      // false = partial result, true = final for this utterance
    public let timestamp: Date
    public let speakerID: String? // nil until Week 7 speaker diarization

    public init(text: String, isFinal: Bool,
               timestamp: Date, speakerID: String? = nil) {
        self.id = UUID()
        self.text = text
        self.isFinal = isFinal
        self.timestamp = timestamp
        self.speakerID = speakerID
    }
}
