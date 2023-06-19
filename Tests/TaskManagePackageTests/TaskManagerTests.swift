//
//  TaskManagerTests.swift
//  
//
//  Created by Alibek Kozhambekov on 19.06.2023.
//

import XCTest
@testable import TaskManagePackage

final class TaskManagerTests: XCTestCase {

	func test_allTasks_addTwoTasks_shouldBeTwoTasks() {
		let task1 = Task(title: "Task 1")
		let task2 = Task(title: "Task 2")

		let sut = TaskManager()
		sut.addTask(task: task1)
		sut.addTask(task: task2)

		let allTasks = sut.allTasks()

		XCTAssertEqual(allTasks.count, 2, "Количество задач, не соответсвует с реальными данными")
		XCTAssertTrue(allTasks.contains(task1), "Отсутсвует задача 1")
		XCTAssertTrue(allTasks.contains(task2), "Отсутсвует задача 2")
	}

	func test_completedTasks_addOneCompletedAndOneUncompletedTask_shouldBeOneCompletedTask() {
		let task1 = Task(title: "Completed Task", completed: true)
		let task2 = Task(title: "Uncompleted Task")

		let sut = TaskManager()
		sut.addTask(task: task1)
		sut.addTask(task: task2)

		let completedTasks = sut.completedTasks()

		XCTAssertEqual(completedTasks.count, 1, "Количество завершенных задач не соответсвует с реальными данными")
		XCTAssertTrue(completedTasks.contains(task1), "Отсутсвует завершенная задача")
		XCTAssertFalse(completedTasks.contains(task2), "Присутсвует не завершенная задача")
	}

	func test_uncompletedTasks_addOneUnompletedAndOneCompletedTask_shouldBeOneUncompletedTask() {
		let task1 = Task(title: "Completed Task", completed: true)
		let task2 = Task(title: "Uncompleted Task")

		let sut = TaskManager()
		sut.addTask(task: task1)
		sut.addTask(task: task2)

		let uncompletedTasks = sut.uncompletedTasks()

		XCTAssertEqual(uncompletedTasks.count, 1, "Количество завершенных задач не соответсвует с реальными данными")
		XCTAssertTrue(uncompletedTasks.contains(task2), "Отсутсвует не завершенная задача")
		XCTAssertFalse(uncompletedTasks.contains(task1), "Присутсвует завершенная задача")
	}

	func test_addTask_addOneTask_shouldBeOneTask() {
		let task = Task(title: "New Task")

		let sut = TaskManager()
		sut.addTask(task: task)

		let allTasks = sut.allTasks()

		XCTAssertTrue(allTasks.contains(task), "Задача не была добавлена")
	}

	func test_addTwoTasks_shouldBeTwoTasks() {
		let task1 = Task(title: "Task 1")
		let task2 = Task(title: "Task 2")

		let sut = TaskManager()
		sut.addTasks(tasks: [task1, task2])

		let allTasks = sut.allTasks()

		XCTAssertEqual(allTasks.count, 2, "Задачи не были добавлены нужным образом")
		XCTAssertTrue(allTasks.contains(task1), "Задача 1 не была добавлена в список")
		XCTAssertTrue(allTasks.contains(task2), "Задача 2 не была добавлена в список")
	}

	func test_removeTask_addTwoTasksAndRemoveOneTask_shouldBeOneTask() {
		let task1 = Task(title: "Task 1")
		let task2 = Task(title: "Task 2")

		let sut = TaskManager()
		sut.addTasks(tasks: [task1, task2])
		sut.removeTask(task: task1)

		let allTasks = sut.allTasks()

		XCTAssertEqual(allTasks.count, 1, "Количество задач не совпадает с реальными данными")
		XCTAssertFalse(allTasks.contains(task1), "Задача 1 не была удалена")
		XCTAssertTrue(allTasks.contains(task2), "Задача 2 не была добавлена")
	}
}

private extension TaskManagerTests {
	func makeSUT() -> [Task] {
		let task1 = Task(title: "Task 1", completed: true)
		let task2 = Task(title: "Task 2")
		let sut = TaskManager()
		sut.addTasks(tasks: [task1, task2])
		return sut.allTasks()
	}
}
