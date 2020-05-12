import Foundation
import ObjectMapper

struct Interest: Identifiable, Codable, Mappable {

    var id: String?
    var name: String?
    var selected: Bool = false
    
    init(name: String) {
        self.name = name
    }
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        selected <- map["selected"]
    }
}

extension Interest {
    static func sample() -> [Interest] {
        return [.init(name: "Relationships"), .init(name: "Friends"), .init(name: "Family"), .init(name: "Work"), .init(name: "Roomates"), .init(name: "School"), .init(name: "Celebrities"), .init(name: "Strangers"), .init(name: "Relationships"), .init(name: "Friends"), .init(name: "Family"), .init(name: "Work"), .init(name: "Roomates"), .init(name: "School"), .init(name: "Celebrities"), .init(name: "Strangers")]
    }
}

