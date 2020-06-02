//
//  OnboardingView.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isLoggedIn: Bool
    @State var showsAlert = false
    @State var showModal: Bool = false
    @State var showPhoneModal: Bool = false
    
    var body: some View {
        NavigationView() {
            ZStack {
                Color.black
                VStack {
                    Spacer()
                    Text("Beef")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 20.0)
                    Text("Where arguments get settled")
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 90.0)
                    Spacer()
                    SignInWithAppleToFirebase { response in
                        switch response {
                        case .success:
                            if UserDefaults.standard.bool(forKey: "onboarded") {
                                self.isLoggedIn.toggle()
                            } else {
                                self.showModal = true
                            }
                        case.error:
                            self.showsAlert = true
                        }
                    }
                    .frame(width: 240, height: 64)
                    .foregroundColor(.red)
                .cornerRadius(10)
                    .background(RoundedRectangle(cornerRadius: 14).foregroundColor(.red))
                    Button(action: {
                        self.showPhoneModal.toggle()
                    }) {
                        OnboardingButton(title: "Phone")
                    }
                    Spacer()
                }

            }.edgesIgnoringSafeArea(.all)
            
        }
        .sheet(isPresented: $showPhoneModal) {
            PhoneAuthView()
        }
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text("Somthing when wrong 😩"))
        }
       .overlay(self.showModal ? InterestsView(isLoggedIn: $isLoggedIn) : nil)
    
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isLoggedIn: .constant(false))
    }
}
