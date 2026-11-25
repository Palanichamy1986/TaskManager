//
//  TaskRepository.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

final class TaskRepository: TaskRepositoryProtocol {
    private var tasks: [TodoTask] = []
    func fetchTasks() async throws -> [TodoTask] {
        return tasks
    }
    
    func addTask(_ task: TodoTask) async throws {
        tasks.append(task)
    }
    
    func updateTask(_ task: TodoTask) async throws {
        guard let index = tasks.firstIndex(where: {
            $0.id == task.id
        }) else {
            return
        }
        tasks[index] = task
    }
    
    func deleteTask(id: UUID) async throws {
        tasks.removeAll { $0.id == id }
    }
}
