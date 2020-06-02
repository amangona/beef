
import SwiftUI
import ComposableArchitecture

struct BFTabView: View {
    //    @EnvironmentObject var settings: AuthSettings
    let store: Store<AppState, AppAction>
    init(store: Store<AppState, AppAction>) {
        self.store = store
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(named: "background")
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Beef")
                }.tag(0)
            ProfileView(store: store)
                .tabItem {
                    Image(systemName: "5.circle")
                    Text("Profile")
            }.tag(1)
            
            Text("Create")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Messages")
            }.tag(3)
        }.background(Color("background"))
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
