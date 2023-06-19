//
//  OrderedTaskManagerTests.swift
//  
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import TaskManagePackage

final class OrderedTaskManagerTests: XCTestCase {

	func test_allTasks_shouldBeOrderedByPriority() {
		let sut = makeSUT()

		let validResultTasks: [TaskManagePackage.Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.uncompletedRegularTask
		]

		let resultTask = sut.allTasks()

		XCTAssertEqual(resultTask.count, 6, "Кол-во задач не соответсвует ожиданиям")
		XCTAssertEqual(resultTask, validResultTasks, "Порядок задач не сортирован по приоритету")
	}

	func test_completedTasks_shouldBeAllComletedTasksOrderedByPriority() {
		let sut = makeSUT()
		let validResultTasks: [TaskManagePackage.Task] = [
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.completedRegularTask
		]

		let resultTask = sut.completedTasks()

		XCTAssertEqual(resultTask.count, 2, "Кол-во выполненных задач не соответсвует ожиданиям")
		XCTAssertEqual(resultTask, validResultTasks, "Порядок выполненных задач не соответсвует ожидаемыму результату")
	}

	func test_uncompletesTasks_shouldBeAllUncompletedTasksOrderedByPriority() {
		let sut = makeSUT()
		let validResults: [TaskManagePackage.Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask
		]

		let resultTask = sut.uncompletedTasks()

		XCTAssertEqual(resultTask.count, 4, "Кол-во не выполненных задач не соответсвует ожиданиям")
		XCTAssertEqual(resultTask, validResults, "Порядок не выполненных задач не соответсвует ожидаемыму результату")
	}
}

private extension OrderedTaskManagerTests {
	func makeSUT() -> OrderedTaskManager {
		let mockTaskManager = MockTaskManager()
		let sut = OrderedTaskManager(taskManager: mockTaskManager)
		return sut
	}
}
