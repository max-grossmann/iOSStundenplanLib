import XCTest
@testable import iOSStundenplanLib

import Foundation

#if os(Linux)
    import FoundationNetworking
    import OpenCombine
    import OpenCombineDispatch
    import OpenCombineFoundation
#else 
    import Combine
#endif

final class iOSStundenplanLibTests: XCTestCase {
    
    func testExample() {
        var cancellable: AnyCancellable = StundenplanAPI.getTestStundenplan()
            .sink(receiveCompletion: { _ in
                print("end")
            }, receiveValue: { (response: Response) in
                XCTAssertTrue(response.schedule.map { $0.docent }.contains{ $0 == "Prof. Dr. Peter Stöhr" })
            })

        sleep(4)

        //XCTAssertEqual(TestStructMax().testMethod, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
