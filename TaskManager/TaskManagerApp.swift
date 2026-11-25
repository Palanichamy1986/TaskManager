//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            TaskListView(viewModel: container.taskListViewModel)
        }
    }
}
