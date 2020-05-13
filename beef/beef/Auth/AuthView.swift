
import SwiftUI

struct AuthView: View {
    //    @ObservedObject var viewModel = AuthViewModel()
    @EnvironmentObject var settings: AuthSettings
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.settings.showAuthView = false
            }) {
                HStack {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                .frame(height: 48/3, alignment: .leading)
                .padding(.top, 28.0)
                .padding()
            }
            PagerView(pageCount: 2, currentIndex: self.$currentPage) {
                SignupView(currentPage: $currentPage)
                LoginView(currentPage: $currentPage)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}


