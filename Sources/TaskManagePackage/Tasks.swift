//
//  Tasks.swift
//  M1L5
//
//  Created by Alibek Kozhambekov on 09.06.2023.
//

import Foundation

public class Task {
	public var title: String
	public var completed = false

	public init(title: String, completed: Bool = false) {
		self.title = title
		self.completed = completed
	}
}

extension Task: Equatable {
	public static func == (lhs: Task, rhs: Task) -> Bool {
		lhs === rhs
	}
}

public final class RegularTask: Task { }

public final class ImportantTask: Task {

	public enum TaskPriority: Int {
		case low
		case medium
		case high
	}

	public var taskPriority: TaskPriority

	public var deadline: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: createdDate)!
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: createdDate)!
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: createdDate)!
		}
	}

	private var createdDate: Date

	public init(title: String, taskPriority: TaskPriority, completed: Bool = false, createdDate: Date = Date()) {
		self.taskPriority = taskPriority
		self.createdDate = createdDate
		super.init(title: title)
	}
}
