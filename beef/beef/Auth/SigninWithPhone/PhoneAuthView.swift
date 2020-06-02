//
//  PhoneAuthView.swift
//  beef
//
//  Created by abe on 5/5/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import Firebase
import ComposableArchitecture
import Combine



struct PhoneAuthView: View {
    //    @Binding var show: Bool
//    @State @ValidNumber var validNumber = ""
    @ObservedObject var observedNumber = NumberValidation()
    @State var countryCode = ""
    @State var number = ""
    @State var ID: String = ""
    @State var showVerification = false
    @State var showAlert: Bool = false
    
    @State var firstName = ""
    @State var lastName = ""
    @State var focused: [Bool] = [true, false]
    
    var viewStore: ViewStore<AppState, AppAction>?
    //    @State var validInput: Bool = false
    //    @Binding var isLoggedIn: Bool
    var body: some View {
        VStack {
            HStack{
                TextField("+1", text: $observedNumber.countryCode)
                    .foregroundColor(.black)
                    .keyboardType(.phonePad)
                    .frame(width: 45)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Rectangle().fill(Color.gray).frame(width: 2, height: 56/3)
                
                TextField("0123456789", text: $observedNumber.number , onCommit: {
                    print("text changed: ")
                })
                    .foregroundColor(.black)
                    .keyboardType(.phonePad)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
            }.padding(.top, 15)
            Rectangle().fill(Color.gray).frame(height: 2).cornerRadius(1)
            
            Button(action: {
                print("phone auth action!!!")
                PhoneAuthProvider.provider().verifyPhoneNumber(self.observedNumber.countryCode+self.observedNumber.number, uiDelegate: nil) { (ID, error) in
                    if error != nil {
                        self.showAlert.toggle() // need to fix this the presentation comes from parent
                    } else {
                        self.ID = ID!
                        self.showVerification.toggle()
                    }
                }
            }) {
                Spacer()
                Text("Send Code")
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
            NavigationLink(destination: PhoneVerificationView(ID: self.ID, viewStore: viewStore), isActive: $showVerification) {EmptyView()}
        }.padding()
            .navigationBarTitle("Add Phone")
            .alert(isPresented: self.$showAlert) {
                Alert(title: Text("Somthing when wrong 😩"))
        }
        
    }
    func validInput() -> Bool {
        observedNumber.countryCode != "" && observedNumber.number.count > 9
    }
}

struct PhoneAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthView()
    }
}
