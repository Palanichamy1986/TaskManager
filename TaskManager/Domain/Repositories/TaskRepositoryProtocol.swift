//
//  TaskRepositoryProtocol.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

protocol TaskRepositoryProtocol {
    func fetchTasks() async throws -> [TodoTask]
    func addTask(_ task: TodoTask) async throws
    func updateTask(_ task: TodoTask) async throws
    func deleteTask(id: UUID) async throws
}
