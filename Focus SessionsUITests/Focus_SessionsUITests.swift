//
//  Focus_SessionsUITests.swift
//  Focus SessionsUITests
//
//  Created by Kristian Matthews-Kennington on 16/09/2024.
//

import XCTest

final class Focus_SessionsUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        
        if name != "testLaunchPerformance" {
            app.launch()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    @MainActor
    func testAddNewSession() {
        app.launch()

        // Use the shared 'app' instance
        let addButton = app.buttons["addSessionButton"]
        XCTAssertTrue(addButton.exists, "Add Session button does not exist")
        addButton.tap()

        let newSession = app.staticTexts["New Session"]
        XCTAssertTrue(newSession.exists, "New Session does not appear after tapping Add Session")
    }

    @MainActor
    func testStartAndPauseSession() {
        app.launch()
        
        // Add a new session first
        let addButton = app.buttons["addSessionButton"]
        XCTAssertTrue(addButton.exists, "Add Session button does not exist")
        addButton.tap()

        let newSession = app.staticTexts["New Session"]
        XCTAssertTrue(newSession.exists, "New Session does not appear after tapping Add Session")

        newSession.tap()

        let startButton = app.buttons["Start Session"]
        XCTAssertTrue(startButton.exists, "Start Session button does not exist")
        startButton.tap()

        let pauseButton = app.buttons["Pause Session"]
        XCTAssertTrue(pauseButton.exists, "Pause Session button does not exist")
        pauseButton.tap()
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}
