//
//  DeleteTaskUseCase.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

struct DeleteTaskUseCase {
    private let repository: TaskRepositoryProtocol

    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: UUID) async throws {
        try await repository.deleteTask(id: id)
    }
}
