//
//  FetchTasksUseCaseTests.swift
//  TaskManagerTests
//
//  Created by apple on 25/11/26.
//

import Foundation
import XCTest
@testable import TaskManager

@MainActor
final class FetchTasksUseCaseTests: XCTestCase {

    func testFetchTasks_returnStoredTasks() async throws {
        // Arrange
        let task1 = TodoTask(id: UUID(), title: "Learn Swift Concurreny", isCompleted: false, createdAt: Date())
        let task2 = TodoTask(id: UUID(), title: "Write Unit Tests", isCompleted: false, createdAt: Date())
        let repository = MockTaskRepository(storedTasks: [task1, task2])
        let useCase = FetchTasksUseCase(repository: repository)

        // Act
        let tasks = try await useCase.execute()

        // Assert
        XCTAssertEqual(tasks.count, 2)
        XCTAssertEqual(tasks[0].title, "Learn Swift Concurreny")
        XCTAssertEqual(tasks[1].title, "Write Unit Tests")
    }

    func testFetchTasks_returnEmptyArray() async throws {
        // Arrange
        let repository = MockTaskRepository(storedTasks: [])
        let useCase = FetchTasksUseCase(repository: repository)

        // Act
        let tasks = try await useCase.execute()

        // Assert
        XCTAssertTrue(tasks.isEmpty)
    }
}
