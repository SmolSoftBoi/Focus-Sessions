//
//  ContentView.swift
//  Focus Sessions
//
//  Created by Kristian Matthews-Kennington on 16/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var sessions: [FocusSession]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(sessions) { session in
                    NavigationLink(destination: SessionView(session: session)) {
                        Text(session.title)
                    }
                }
                .onDelete(perform: deleteSessions)
            }
            .navigationTitle("Focus Sessions")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addSession) {
                        Label("Add Session", systemImage: "plus")
                    }
                    .accessibilityIdentifier("addSessionButton")
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addSession() {
        withAnimation {
            let newSession = FocusSession(title: "New Session", duration: 1500)
            modelContext.insert(newSession)
        }
    }

    private func deleteSessions(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(sessions[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [FocusSession.self], inMemory: true)
}
