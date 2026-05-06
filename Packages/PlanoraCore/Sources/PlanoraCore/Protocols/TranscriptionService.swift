//
//  TranscriptionService.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation

public protocol TranscriptionService: Sendable {
    // Ask the user for microphone + speech recognition permission
    func requestAuthorization() async throws

    // Begin audio capture and recognition
    func start() async throws

    // Stop cleanly — finishes the stream
    func stop() async

    // The live stream of recognized text chunks
    func stream() -> AsyncStream<TranscriptChunk>
}
