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
        let app = XCUIApplication()
        app.launch()

        // Act - Open Add Task
        let addButton = app.buttons["addTaskButton"]

        XCTAssertTrue(addButton.waitForExistence(timeout: 10))
        addButton.tap()

        // Enter Task Title
        let titleTextField = app.textFields["taskTitleTextField"]

        XCTAssertTrue(titleTextField.waitForExistence(timeout: 10))
        titleTextField.tap()
        titleTextField.typeText("Learn UI Testing")

        // Save Task
        let saveButton = app.buttons["saveTaskButton"]

        XCTAssertTrue(saveButton.waitForExistence(timeout: 10))
        saveButton.tap()

        // Assert
        XCTAssertTrue(
            app.staticTexts["Learn UI Testing"].waitForExistence(timeout: 10)
        )
    }
}
