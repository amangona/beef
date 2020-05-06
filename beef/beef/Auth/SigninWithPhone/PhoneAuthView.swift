//
//  PhoneAuthView.swift
//  beef
//
//  Created by abe on 5/5/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import Firebase

struct PhoneAuthView: View {
    @Binding var show: Bool
    @State var countryCode = ""
    @State var number = ""
    @State var ID: String = ""
    @State var showVerification = false
    @State var showAlert: Bool = false
    @Binding var isLoggedIn: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                VStack {
                    Text("Enter Phone number")
                        .foregroundColor(.white)
                    HStack{
                        TextField("+1", text: $countryCode)
                            .foregroundColor(.black)
                            .keyboardType(.numberPad)
                            .frame(width: 45)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                           
                        
                        TextField("Number", text: $number)
                            .foregroundColor(.black)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }.padding(.top, 15)
                    NavigationLink(destination: PhoneVerificationView(ID: self.ID, completed: $show, isLoggedIn: self.$isLoggedIn), isActive: $showVerification) {
                        Button(action: {
                            PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.countryCode+self.number, uiDelegate: nil) { (ID, error) in
                                if error != nil {
                                    self.showAlert.toggle() // need to fix this the presentation comes from parent
                                } else {
                                    self.ID = ID!
                                    self.showVerification.toggle()
                                }
                            }
                        }) {
                            OnboardingButton(title: "Send")
                        }
                    }
                    
                }.padding()
            }.edgesIgnoringSafeArea(.all)
        }.alert(isPresented: self.$showAlert) {
            Alert(title: Text("Somthing when wrong 😩"))
        }
        
        
    }
}

struct PhoneAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthView(show: .constant(false), isLoggedIn: .constant(false))
    }
}
