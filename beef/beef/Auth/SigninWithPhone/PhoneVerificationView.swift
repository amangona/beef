

import SwiftUI
import FirebaseAuth

struct PhoneVerificationView: View {
    @State var ID: String
    @State var code: String = ""
    @State var showAlert: Bool = false
    @Binding var completed: Bool
    @Binding var isLoggedIn: Bool
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Enter Code")
                    .foregroundColor(Color.white)
                TextField("Code", text: $code)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: {
                    let credentials = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                    Auth.auth().signIn(with: credentials) { (results, error) in
                        if error != nil {
                            self.showAlert.toggle()
                        } else {
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
                    OnboardingButton(title: "Verify")
                }
            }
        }.edgesIgnoringSafeArea(.all)
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Somthing when wrong 😩"))
        }
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView(ID: "", code: "", completed: .constant(false), isLoggedIn: .constant(false))
    }
}
