//
//  ScrumApp.swift
//  Scrum
//
//  Created by Aleksandr Polev on 2025-01-08.
//

import SwiftUI

@main
struct ScrumApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
