

import SwiftUI
import FirebaseAuth
import ComposableArchitecture
import Combine

struct VerificationNumberView: View {
    @Binding var text: String
    var body: some View {
        VStack {
            TextField("0", text: $text)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack(spacing: 10) {
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
                Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
            }
            
        }
    }
}

class NumberValidation: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var countryCode: String  = ""{
        willSet {
            objectWillChange.send()
        }
        didSet {
            if countryCode == "++" {
                countryCode = " "
            } else {
                countryCode = "+"+String(countryCode.last!)
            }
        }
    }
    
    var number: String  = ""{
        willSet {
            objectWillChange.send()
        }
        didSet {
            if number.count > 10 {
                number = String(number.prefix(10))
            }
        }
    }
    var code: String = "" {
        willSet {
            objectWillChange.send()
        }
        didSet {
            print("number: ",code.count)
            if code.count > 6 {
                code = String(code.prefix(6))
            } else {
                number = "  "+number
                print("number1: ",code)
            }
        }
    }

}

struct PhoneVerificationView: View {
    @State var ID: String
    @State var code: String = ""
//    @State var code2: String = ""
//    @State var code3: String = ""
//    @State var code4: String = ""
//    @State var code5: String = ""
//    @State var code6: String = ""
    @State var showAlert: Bool = false
    var viewStore: ViewStore<AppState, AppAction>?
//    @Binding var completed: Bool
//    @Binding var isLoggedIn: Bool
    @ObservedObject var observedNumber = NumberValidation()
    var body: some View {
        
        VStack {
            HStack(spacing: 10) {
                VerificationNumberView(text: $observedNumber.code)
//                VerificationNumberView(text: $code2)
//                VerificationNumberView(text: $code3)
//                VerificationNumberView(text: $code4)
//                VerificationNumberView(text: $code5)
//                VerificationNumberView(text: $code6)
            }.padding()
            
            
            Button(action: {
                print("Authenticate buy passing some user object to an action that checks if user exists and if not the user will created")
                                    let credentials = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                                    Auth.auth().signIn(with: credentials) { (results, error) in
                                        if error != nil {
                                            self.showAlert.toggle()
                                        } else {
                                            print("The user is authenticated with some user")
                //                            self.viewStore?.send(.authenticate)
                //                            BFAuthentication.shared.createUser { (completed) in
                //                                if completed {
                //                                    self.completed.toggle()
                //                                    self.isLoggedIn.toggle()
                //                                } else {
                //                                    print("COULD NOT COMPETE PHONE AUTH")
                //                                }
                //
                //                            }
                
                                        }
                                    }
            }) {
                Spacer()
                Text("Verify")
                    .font(.system(size: 40/3))
                    .fontWeight(.bold)
                    .foregroundColor(validInput() ? .white : .gray)
                    .padding()
                Spacer()
            }
            .background(RoundedRectangle(cornerRadius: 15)
            .opacity(validInput() ? 1.0 : 0.2)
            .foregroundColor(validInput() ? .red : .gray))
            .disabled(!validInput())
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("Enter Code")
        .padding()
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Somthing when wrong 😩"))
        }
    }
    func validInput() -> Bool {
        code != ""
//        code1 != "" && code2 != "" && code3 != "" && code4 != "" && code5 != "" && code6 != ""
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView(ID: "")
    }
}
