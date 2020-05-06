import Foundation
import Combine

final class AuthViewModel: ObservableObject {
    let api = API()
    private var subscriptions =  Set<AnyCancellable>()
    
    func signup() {
        
//        Authentication.shared.signup(with: "abe69@gmail.com", password: "12345678")
        
//        api.signup(name: "abe", username: "easyAbe", password: "123456")
//            .sink(receiveCompletion: { (completion) in
//                print("completed")
//            }) { (user) in
//                print("user: ", user)
//        }.store(in: &subscriptions)
        
//        let user = CreateUser(name: "abe", username: "easyAbe", password: "12345678")
//        ResourceRequest<CreateUser>(resourcePath: "users").save(user) { [weak self] result in
//            print("RESULT: ", result)
//
//          switch result {
//          case .failure:
//            print("RESULT FAILED: ", result)
////            ErrorPresenter.showError(message: "There was a problem saving the user", on: self)
//          case .success:
//            DispatchQueue.main.async { [weak self] in
//                print("PASSED: ", result)
////              self?.navigationController?.popViewController(animated: true)
//            }
//          }
//        }
        
    }
    
}
