//struct iOSStundenplanLib {
//    var text = "Hello, World!"
//}
import Foundation

#if os(Linux)
    import FoundationNetworking
    import OpenCombine
    import OpenCombineDispatch
    import OpenCombineFoundation
#else 
    import Combine
#endif

public struct Response: Codable {
    public let version: Double
    public let schedule: [Event]
}

public struct Event: Codable {
    public let label: String
    public let docent: String
}

public class StundenplanAPI {

    public static func getTestStundenplan() -> AnyPublisher<Response, Never> {
        let url = URL(string: "https://app.hof-university.de/soap/client.php?f=Schedule&stg=Mc&sem=5&tt=WS")
        var request = URLRequest(url: url!)

        let passInfo = "soapuser:F%98z&12"
        let passData = passInfo.data(using: .utf8)
        let passCredential = passData?.base64EncodedString()
        request.setValue("Basic \(passCredential!)", forHTTPHeaderField: "Authorization")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map {
                $0.data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .replaceError(with: Response(version: -1, schedule: []))
            .eraseToAnyPublisher()
    }
}

public struct TestStructMax {
    public var text = "Hi, World!"

    public init(text: String) {
        self.text = text;
    }

}
