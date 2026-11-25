import SwiftUI

struct TaskListView: View {

    @StateObject var viewModel: TaskListViewModel

    @State private var editor: TaskEditor?
    @State private var taskTitle = ""

    var body: some View {

        NavigationStack {

            List {

                ForEach(viewModel.tasks) { task in

                    HStack {

                        Text(task.title)
                            .accessibilityIdentifier("taskTitle_\(task.id)")

                        Spacer()

                        Button {
                            taskTitle = task.title
                            editor = .edit(task)
                        } label: {
                            Image(systemName: "pencil")
                        }
                        .buttonStyle(.borderless)

                        Button(role: .destructive) {
                            Task {
                                await viewModel.deleteTask(task)
                            }
                        } label: {
                            Image(systemName: "trash")
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Button {
                        taskTitle = ""
                        editor = .add
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityIdentifier("addTaskButton")
                }
            }
            .sheet(item: $editor) { selectedEditor in

                NavigationStack {

                    Form {
                        TextField("Task title", text: $taskTitle)
                            .accessibilityIdentifier("taskTitleTextField")
                    }
                    .navigationTitle(
                        selectedEditor.isEditing ? "Edit Task" : "Add Task"
                    )
                    .toolbar {

                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                editor = nil
                            }
                        }

                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {

                                let title = taskTitle.trimmingCharacters(
                                    in: .whitespacesAndNewlines
                                )

                                guard !title.isEmpty else { return }

                                Task {
                                    switch selectedEditor {

                                    case .add:
                                        await viewModel.addTask(title: title)

                                    case .edit(let task):
                                        await viewModel.updateTask(
                                            task,
                                            title: title
                                        )
                                    }

                                    editor = nil
                                }
                            }
                            .accessibilityIdentifier("saveTaskButton")
                        }
                    }
                }
            }
            .task {
                await viewModel.loadTasks()
            }
        }
    }
}

enum TaskEditor: Identifiable {

    case add
    case edit(TodoTask)

    var id: String {
        switch self {
        case .add:
            return "add"
        case .edit(let task):
            return task.id.uuidString
        }
    }

    var isEditing: Bool {
        switch self {
        case .add:
            return false
        case .edit:
            return true
        }
    }
}
