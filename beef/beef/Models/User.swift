import ObjectMapper
import Firebase

class User: Codable, Mappable, Identifiable {

    var id: String?
    var name: String?
    var username: String?
    var phoneNumber: String?
    var userData: UserData?
    var interests: [Interest]?
    
    init(id: String) {
        self.id = id
    }
    
    init(id: String, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
    
    init(userData: UserData, id: String) {
        self.id = id
        self.userData = userData
        self.name = userData.name.description
        self.username = userData.displayName()
    }
    
    init(id: String, phoneNumber: String) {
        self.id = id
        self.phoneNumber = phoneNumber
    }
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        id     <- map["id"]
        name     <- map["name"]
        username <- map["username"]
        userData <- map["userData"]
    }
    
}

