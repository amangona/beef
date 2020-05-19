
import SwiftUI
import ComposableArchitecture

struct AuthView: View {
    //    @ObservedObject var viewModel = AuthViewModel()
//    @EnvironmentObject var settings: AuthSettings
    @State var currentPage = 0
    var viewStore: ViewStore<AppState, AppAction>?
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
//                Button(action: {
//                    self.viewStore?.send(.someAction)
//                }) {
//                    HStack {
//                        Image("close")
//                            .resizable()
//                            .scaledToFit()
//                        Spacer()
//                    }
//                    .frame(height: 48/3, alignment: .leading)
//                    .padding(.top, 28.0)
//                    .padding()
//                }
                PagerView(pageCount: 2, currentIndex: self.$currentPage) {
                    SignupView(currentPage: $currentPage, viewStore: viewStore)
                    LoginView(currentPage: $currentPage, viewStore: viewStore)
                }
                Spacer()
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewStore?.send(.someAction)
                }, label: {
                    HStack {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    .frame(height: 48/3, alignment: .leading)
                    .padding(.top, 28.0)
                    .padding()
                })
            )
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewStore: .none)
    }
}


