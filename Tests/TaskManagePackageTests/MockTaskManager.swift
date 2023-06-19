//
//  MockTaskManager.swift
//  
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

@testable import TaskManagePackage

final class MockTaskManager: ITaskManager {

	static let highImportantTask = ImportantTask(title: "highImportantTask", taskPriority: .high)
	static let mediumImportantTask = ImportantTask(title: "mediumImportantTask", taskPriority: .medium)
	static let lowImportantTask = ImportantTask(title: "lowImportantTask", taskPriority: .low)
	static let completedRegularTask = RegularTask(title: "completedRegularTask", completed: true)
	static let uncompletedRegularTask = RegularTask(title: "uncompletedRegularTask")
	static let completedHighImportantTask = ImportantTask(title: "completedHighImportantTask", taskPriority: .high, completed: true)

	func allTasks() -> [TaskManagePackage.Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.completedHighImportantTask
		]
	}

	func completedTasks() -> [TaskManagePackage.Task] {
		[
			MockTaskManager.completedRegularTask,
			MockTaskManager.completedHighImportantTask
		]
	}

	func uncompletedTasks() -> [TaskManagePackage.Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.mediumImportantTask
		]
	}

	func addTasks(tasks: [TaskManagePackage.Task]) {
		fatalError("Not implemented!")
	}
}
