//
//  FetchTasksUseCase.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

struct FetchTasksUseCase {
    private let repository: TaskRepositoryProtocol

    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [TodoTask] {
        try await repository.fetchTasks()
    }
}
