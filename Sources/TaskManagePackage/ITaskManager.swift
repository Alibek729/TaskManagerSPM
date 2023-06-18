//
//  ITaskManager.swift
//  M1L5
//
//  Created by Alibek Kozhambekov on 09.06.2023.
//

import Foundation

public protocol ITaskManager {
	func allTasks() -> [Task]
	func completedTasks() -> [Task]
	func uncompletedTasks() -> [Task]
	func addTasks(tasks: [Task])
}

extension TaskManager: ITaskManager { }

extension ImportantTask.TaskPriority: CustomStringConvertible {
	public var description: String {
		switch self {

		case .low:
			return "!"
		case .medium:
			return "!!"
		case .high:
			return "!!!"
		}
	}
}


