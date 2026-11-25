//
//  AppContainer.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

@MainActor
final class AppContainer {

    let taskListViewModel: TaskListViewModel

    init() {
        let repository: any TaskRepositoryProtocol = TaskRepository()

        let fetchTasksUseCase = FetchTasksUseCase(repository: repository)
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let updateTaskUseCase = UpdateTaskUseCase(repository: repository)
        let deleteTaskUseCase = DeleteTaskUseCase(repository: repository)

        taskListViewModel = TaskListViewModel(
            fetchTasksUseCase: fetchTasksUseCase,
            addTaskUseCase: addTaskUseCase,
            updateTaskUseCase: updateTaskUseCase,
            deleteTaskUseCase: deleteTaskUseCase
        )
    }
}
