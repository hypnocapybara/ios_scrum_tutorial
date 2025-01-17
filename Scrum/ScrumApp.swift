//
//  ScrumApp.swift
//  Scrum
//
//  Created by Aleksandr Polev on 2025-01-08.
//

import SwiftUI

@main
struct ScrumApp: App {
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
