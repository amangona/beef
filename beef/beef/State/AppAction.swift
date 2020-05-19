// Theses are the app action the user will takes that speaks with the outside world.

enum AppAction: Equatable {
    case authenticate
    case someAction
    case auth(type: AuthType)
}

