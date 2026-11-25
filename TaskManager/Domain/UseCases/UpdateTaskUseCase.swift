//
//  UpdateTaskUseCase.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

struct UpdateTaskUseCase {
    private let repository: TaskRepositoryProtocol

    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ task: TodoTask) async throws {
        try await repository.updateTask(task)
    }
}
