//
//  Focus_SessionsApp.swift
//  Focus Sessions
//
//  Created by Kristian Matthews-Kennington on 16/09/2024.
//

import SwiftUI
import SwiftData

@main
struct Focus_SessionsApp: App {
    var sharedModelContainer: ModelContainer

    init() {
        NotificationManager.shared.requestAuthorization()

        let schema = Schema([
            FocusSession.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // Handle the error appropriately
            print("Error initializing ModelContainer with configuration: \(error)")
            do {
                sharedModelContainer = try ModelContainer(for: schema)
            } catch {
                fatalError("Failed to initialize ModelContainer: \(error)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
