import Foundation
import Combine


@MainActor
final class TaskListViewModel: ObservableObject {

    @Published private(set) var tasks: [TodoTask] = []

    private let fetchTasksUseCase: FetchTasksUseCase
    private let addTaskUseCase: AddTaskUseCase
    private let updateTaskUseCase: UpdateTaskUseCase
    private let deleteTaskUseCase: DeleteTaskUseCase

    init(
        fetchTasksUseCase: FetchTasksUseCase,
        addTaskUseCase: AddTaskUseCase,
        updateTaskUseCase: UpdateTaskUseCase,
        deleteTaskUseCase: DeleteTaskUseCase
    ) {
        self.fetchTasksUseCase = fetchTasksUseCase
        self.addTaskUseCase = addTaskUseCase
        self.updateTaskUseCase = updateTaskUseCase
        self.deleteTaskUseCase = deleteTaskUseCase
    }

    func loadTasks() async {
        do {
            tasks = try await fetchTasksUseCase.execute()
        } catch {
            print("Fetch error:", error)
        }
    }

    func addTask(title: String) async {

        let task = TodoTask(
            id: UUID(),
            title: title,
            isCompleted: false,
            createdAt: Date()
        )

        do {
            try await addTaskUseCase.execute(task)
            await loadTasks()
        } catch {
            print("Add error:", error)
        }
    }

    func updateTask(_ task: TodoTask, title: String) async {

        var updatedTask = task
        updatedTask.title = title

        do {
            try await updateTaskUseCase.execute(updatedTask)
            await loadTasks()
        } catch {
            print("Update error:", error)
        }
    }

    func deleteTask(_ task: TodoTask) async {

        do {
            try await deleteTaskUseCase.execute(id: task.id)
            await loadTasks()
        } catch {
            print("Delete error:", error)
        }
    }
}
