//
//  ImportantTaskTests.swift
//  
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import TaskManagePackage

final class ImportantTaskTests: XCTestCase {

	func test_createImportantTask_withLowPriority_deadlineShoulBeIn3Days() {
		let createdDate = Date()

		let sut = ImportantTask(title: "LowPriority Task", taskPriority: .low, createdDate: createdDate)

		let deadline = Calendar.current.date(byAdding: .day, value: 3, to: createdDate)!

		XCTAssertEqual(sut.deadline, deadline)
	}

	func test_createImportantTask_withMediumPriority_deadlineShouldBeIn2Days() {
		let createdDate = Date()

		let sut = ImportantTask(title: "LowPriority Task", taskPriority: .medium, createdDate: createdDate)

		let deadline = Calendar.current.date(byAdding: .day, value: 2, to: createdDate)!

		XCTAssertEqual(sut.deadline, deadline)
	}

	func test_createImportantTask_withHighPriority_deadlineShouldBeIn1Day() {
		let createdDate = Date()

		let sut = ImportantTask(title: "LowPriority Task", taskPriority: .high, createdDate: createdDate)

		let deadline = Calendar.current.date(byAdding: .day, value: 1, to: createdDate)!

		XCTAssertEqual(sut.deadline, deadline)
	}

	func test_createImportantTask_initShouldBeValid() {
		let title = "Important Task"
		let taskPriority = ImportantTask.TaskPriority.low

		let sut = ImportantTask(title: title, taskPriority: taskPriority, createdDate: Date())

		XCTAssertEqual(sut.title, title, "При инициализаций наименование задачи не передается нужным образом")
		XCTAssertEqual(sut.taskPriority, taskPriority, "При инициализаций приоритет задачи не передается нужным образом")
	}
}
