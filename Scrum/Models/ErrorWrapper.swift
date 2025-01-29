//
//  ErrorWrapper.swift
//  Scrum
//
//  Created by Aleksandr Polev on 2025-01-26.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
    
}
