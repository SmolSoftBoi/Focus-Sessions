//
//  Focus_SessionsTests.swift
//  Focus SessionsTests
//
//  Created by Kristian Matthews-Kennington on 16/09/2024.
//

import Testing
import XCTest
import SwiftData
@testable import Focus_Sessions

struct Focus_SessionsTests {

    @Test func testFocusSessionInitialization() async throws {
        let title = "Test Session"
        let duration: TimeInterval = 1500
        let session = FocusSession(title: title, duration: duration)

        XCTAssertEqual(session.title, title)
        XCTAssertEqual(session.duration, duration)
        XCTAssertFalse(session.isCompleted)
    }

    @Test func testFocusSessionCompletion() async throws {
        let session = FocusSession(title: "Test Session", duration: 1500)
        session.isCompleted = true

        XCTAssertTrue(session.isCompleted)
    }
}
