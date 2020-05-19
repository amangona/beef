import ComposableArchitecture
import Firebase

let appReducer = Reducer<AppState, AppAction, AppEnvironment> {
    state, action, environment in
    // check if user is authenticated before switching on action. If not authenticated the user will be directed to the auhten tication screen.
    
    switch action {
    case .authenticate:
        // This is not a protected action 
        
        print("user is authenticated..")
        return .none
    case .auth(type: let type):
        BFAuthentication.shared.auth(with: type) {
            print("done with auth...")
        }
        print("auth for type: ", type)
        return .none
    case .someAction:
        // This is the idea of a protected action. Possibly create a another set of action and define them as protected actions
        guard let user = Auth.auth().currentUser else {
            state.showAuth.toggle()
            return .none
        }
        print("some action handler..")
        return .none
        
        
    }
    
}.debug()
