
import SwiftUI
import ComposableArchitecture

struct BFTabView: View {
    //    @EnvironmentObject var settings: AuthSettings
    let store: Store<AppState, AppAction>
    
    var body: some View {
        TabView {
            ProfileView(store: store)
                .tabItem {
                    Image(systemName: "5.circle")
                    Text("Profile")
                    
            }.tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Search")
            }.tag(1)
            Text("Create")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Create")
            }.tag(3)
            Text("Notification")
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Search")
            }.tag(4)
            Text("Beef")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Beef")
            }.tag(5)
        }
    }
}

struct BFTabView_Previews: PreviewProvider {
    static var previews: some View {
        BFTabView(store: Store(
        initialState: AppState(),
        reducer: appReducer,
        environment: AppEnvironment())
        )
    }
}
