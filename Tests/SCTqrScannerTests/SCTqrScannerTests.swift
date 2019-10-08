import XCTest
@testable import SCTqrScanner

final class SCTqrScannerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SCTqrScanner().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
