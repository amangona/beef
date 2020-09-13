
import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<AppState, AppAction>
//    @State var isLoggedIn: Bool
//    @EnvironmentObject var settings: AuthSettings
//    @ViewBuilder
    var body: some View {
        WithViewStore(self.store) { viewStore in
            BFTabView(store: self.store)
                .sheet(isPresented: viewStore.binding(get: { $0.showAuth
                }, send: .authenticate), onDismiss: {
                    if viewStore.showAuth {
                        // toggles if still showing is there
                        viewStore.send(.someAction)
                    }
                }, content: {
                    AuthView(viewStore: viewStore)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment())
        )
    }
}

