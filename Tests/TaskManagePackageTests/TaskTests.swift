import XCTest

@testable import TaskManagePackage

final class TaskTests: XCTestCase {

	var task: Task!

	override func setUp() {
		super.setUp()
		task = Task(title: "Test Task")
	}

	override func tearDown() {
		task = nil
		super.tearDown()
	}

	func test_init_isCompleteShouldBeFalse() {
		XCTAssertEqual(task.title, "Test Task")
		XCTAssertFalse(task.completed, "Не верно создается класс")
	}

	func test_completedSetTrue_completedShouldBeTrue() {
		task.completed = true
		XCTAssertTrue(task.completed, "Не возможно завершить задание")
	}
}
