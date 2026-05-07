//
//  File.swift
//  PlanoraCore
//
//  Created by Bibek upreti on 07/05/2026.
//

import Foundation

// For wrapping non-Sendable values crossing concurrency boundaries
public struct UncheckedSendable<T>: @unchecked Sendable {
    public let value: T
    
    public init(_ value: T) {
        self.value = value
    }
}

