//
//  SignupView.swift
//  beef
//
//  Created by abe on 5/12/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SignupView: View {
    @Binding var currentPage: Int
    var viewStore: ViewStore<AppState, AppAction>?
    @Binding var showPhoneAuth: Bool
    var body: some View {
        VStack {
            Text("Sign up for Beef")
                .font(.system(size: 72/3))
                .fontWeight(.bold)
            Text("Create a profile to make your own beefs, vote on posts, follow other accounts, and more.")
                .font(.system(size: 40/3))
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
                .padding(.top, 62/3)
                .padding(.horizontal, 38.0)
            
            VStack {
                AuthButton(authType: .snapchat, viewStore: viewStore)
                AuthButton(authType: .apple, viewStore: viewStore)
                AuthButton(authType: .twitter, viewStore: viewStore)
                AuthButton(authType: .phone, viewStore: viewStore) {
                    self.showPhoneAuth.toggle()
                }
            }
            VStack {
                Text("By continuing, you agree to Beef's ")
                HStack(spacing: 0) {
                    Button("Terms of Use") {}
                    Text(" and ")
                    Button("Privacy Policy") {}
                    Text(".")
                }
            }
            .padding(.top, 132.0)
            VStack {
                HStack {
                    Spacer()
                    Text("Aready have an account? ")
                        .foregroundColor(Color.black)
                    Button("Log In") {
                        self.currentPage = 1
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding([.top, .trailing], 20.0)
            .background(Color.gray)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(currentPage: .constant(0), showPhoneAuth: .constant(false))
    }
}
