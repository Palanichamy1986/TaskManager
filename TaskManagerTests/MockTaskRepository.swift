//
//  MockTaskRepository.swift
//  TaskManagerTests
//
//  Created by apple on 25/11/26.
//

import Foundation
@testable import TaskManager

final class MockTaskRepository: TaskRepositoryProtocol {
    private var storedTasks: [TodoTask]

    init(storedTasks: [TodoTask]) {
        self.storedTasks = storedTasks
    }

    func fetchTasks() async throws -> [TodoTask] {
        return storedTasks
    }

    func addTask(_ task: TodoTask) async throws {
        storedTasks.append(task)
    }

    func updateTask(_ task: TodoTask) async throws {
        guard let index = storedTasks.firstIndex(where: {
            $0.id == task.id
        }) else {
            return
        }
        storedTasks[index] = task
    }

    func deleteTask(id: UUID) async throws {
        storedTasks.removeAll(where: {
            $0.id == id
        })
    }
}
