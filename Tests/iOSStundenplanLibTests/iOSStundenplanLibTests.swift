import XCTest
@testable import TestStructMax

final class iOSStundenplanLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        TestStructMax.testMethod()
        //XCTAssertEqual(TestStructMax().testMethod, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
