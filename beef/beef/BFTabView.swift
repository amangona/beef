
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
            ProfileView(store: store)
                .tabItem {
                    Image("profile_tab")
            }.tag(0)
            HomeView()
            .tabItem {
                Image("beef_tab")
            }.tag(1)
            MessagesView()
                .tabItem {
                    Image("messages_tab")
            }.tag(2)
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
