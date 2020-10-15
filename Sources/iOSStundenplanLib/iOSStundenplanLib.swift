//struct iOSStundenplanLib {
//    var text = "Hello, World!"
//}
import Foundation
import FoundationNetworking
import OpenCombine
import OpenCombineDispatch
import OpenCombineFoundation


struct Response: Codable {
    let version: Double
    let schedule: [Event]
}

struct Event: Codable {
    let label: String
    let docent: String
}

public struct TestStructMax {
    public var text = "Hi, World!"

    public init(text: String) {
        self.text = text;
    }

    public func testMethod(){
        
        let url = URL(string: "https://app.hof-university.de/soap/client.php?f=Schedule&stg=Mc&sem=5&tt=WS")
        var request = URLRequest(url: url!)

        let passInfo = "soapuser:F%98z&12"
        let passData = passInfo.data(using: .utf8)
        let passCredential = passData?.base64EncodedString()
        request.setValue("Basic \(passCredential!)", forHTTPHeaderField: "Authorization")

        let publisher2 = URLSession.shared.dataTaskPublisher(for: request)
                .map {
                    $0.data
                }
                .decode(type: Response.self, decoder: JSONDecoder())
                .replaceError(with: Response(version: -1, schedule: []))
                .eraseToAnyPublisher()

        var cancellable: AnyCancellable = publisher2
                .sink(receiveCompletion: { _ in

            print("end")
        }, receiveValue: { (response: Response) in

            for item in response.schedule {
                print("Item: \(item.docent)")
            }
        })

        sleep(4)
    }

}
