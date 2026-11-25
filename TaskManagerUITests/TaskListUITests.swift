//
//  TaskListUITests.swift
//  TaskManagerUITests
//
//  Created by apple on 25/11/26.
//

import Foundation
import XCTest

final class TaskListUITests: XCTestCase {

    func testAppLaunch() throws {
        // Arrange
        let app = XCUIApplication()
        app.launch()

        // Assert
        XCTAssertTrue(app.exists)
    }

    func testAddTask() throws {
        // Arrange
        let app  = XCUIApplication()
        app.launch()

        // Act
        app.buttons["addTaskButton"].tap()

        let titleTextField = app.textFields["taskTitleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Learn UI Testing")

        app.buttons["saveTaskButton"].tap()

        // Assert
        XCTAssertTrue(app.staticTexts["Learn UI Testing"].exists)
    }
}
