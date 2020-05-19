import SwiftUI
import Firebase

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Protected: ViewModifier {
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if Auth.auth().currentUser != nil {
            content.background(Color.green)
                .onTapGesture {
                    print("Tapped View")
            }
        } else {
            content.background(Color.red)
        }
    }
}

extension View {
    
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func protected() -> some View {
        self.modifier(Protected())
    }
    
    
//    @discardableResult
//    func protect() -> some View {
//        let user = Auth.auth().currentUser
//        if user == nil {
//            return self
//        } else {
//            return self.background(Color.red) as? Self
//        }
//    }
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

//struct UserDefaultsConfig {
//    @UserDefault("isAuthenticated", defaultValue: false)
//    static var isAuthenticaed: Bool
//}

//@propertyWrapper
//struct AuthProtected<ProtectedView: View> {
//    let user = Auth.auth().currentUser
//    let defaultValue: ProtectedView
//
//    var wrappedValue: ProtectedView {
//        get {
//            return ProtectedView.background(Color.red) as? ProtectedView ?? defaultValue
//        }
////        set {
////
//////            UserDefaults.standard.set(newValue, forKey: key)
////        }
//    }
//}



// 
