import SwiftUI

enum AuthType {
    case snapchat
    case apple
    case twitter
    case phone
    
    var text: Text {
        switch self {
            case .snapchat: return Text("Continue with Snapchat")
            case .apple: return Text("Continue with Apple")
            case .twitter: return Text("Continue with Twitter")
            case .phone: return Text("Or use phone")
        }
    }
    
    var image: Image {
        switch self {
            case .snapchat: return Image("snapchat")
            case .apple: return Image("apple")
            case .twitter: return Image("twitter")
            case .phone: return Image("phone")
        }
    }
}
