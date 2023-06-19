import XCTest

@testable import TaskManagePackage

final class TaskTests: XCTestCase {

	func test_init_isCompleteShouldBeFalse() {
		let sut = makeSUT()

		XCTAssertEqual(sut.title, "Test Task")
		XCTAssertFalse(sut.completed, "Не верно создается класс")
	}

	func test_completedSetTrue_completedShouldBeTrue() {
		let sut = makeSUT()

		sut.completed = true
		XCTAssertTrue(sut.completed, "Не возможно завершить задание")
	}
}

private extension TaskTests {
	func makeSUT() -> Task {
		return Task(title: "Test Task")
	}
}
