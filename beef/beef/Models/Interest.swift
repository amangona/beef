import Foundation

struct Interest: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var selected: Bool = false
}

extension Interest {
    static func sample() -> [Interest] {
        return [.init(name: "Relationships"), .init(name: "Friends"), .init(name: "Family"), .init(name: "Work"), .init(name: "Roomates"), .init(name: "School"), .init(name: "Celebrities"), .init(name: "Strangers"), .init(name: "Relationships"), .init(name: "Friends"), .init(name: "Family"), .init(name: "Work"), .init(name: "Roomates"), .init(name: "School"), .init(name: "Celebrities"), .init(name: "Strangers")]
    }
}

