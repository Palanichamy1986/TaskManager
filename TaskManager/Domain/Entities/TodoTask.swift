//
//  TodoTask.swift
//  TaskManager
//
//  Created by apple on 15/11/26.
//

import Foundation

struct TodoTask: Identifiable, Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    let createdAt: Date

    init(id: UUID, title: String, isCompleted: Bool, createdAt: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
