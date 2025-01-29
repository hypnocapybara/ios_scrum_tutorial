//
//  ScrumStore.swift
//  Scrum
//
//  Created by Aleksandr Polev on 2025-01-25.
//

import Foundation


class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileUrl()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        
        let scrums = try await task.value
//        self.scrums = scrums
        
        await MainActor.run {
            self.scrums = scrums
        }
    }
    
    func save() async throws {
        let task = Task {
            let data = try JSONEncoder().encode(self.scrums)
            let outfile = try Self.fileUrl()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
