import XCTest
@testable import iOSStundenplanLib

final class iOSStundenplanLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        TestStructMax(text: "x").testMethod()
        //XCTAssertEqual(TestStructMax().testMethod, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
