//
//  LoginView.swift
//  beef
//
//  Created by abe on 5/12/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    @Binding var currentPage: Int
    var viewStore: ViewStore<AppState, AppAction>?
    
    var body: some View {
        VStack {
            
            Text("Log In to Beef")
                .font(.system(size: 72/3))
                .fontWeight(.bold)
            Text("Manage your beefs, vote on posts, follow other accounts, and more.")
                .font(.system(size: 40/3))
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
                .padding(.top, 62/3)
                .padding(.horizontal, 38.0)
            
            VStack {
                AuthButton(authType: .snapchat, viewStore: viewStore)
                AuthButton(authType: .apple, viewStore: viewStore)
                AuthButton(authType: .twitter, viewStore: viewStore)
                AuthButton(authType: .phone, viewStore: viewStore)
            }
            //TO DO: Replace bottom view with empty view of right spacing
            VStack {
                Text(" ")
                HStack(spacing: 0) {
                    Button(" ") {}
                    Text(" ")
                    Button(" ") {}
                    Text(" ")
                }
            }
            .padding(.top, 132.0)
            VStack {
                HStack {
                    Spacer()
                    Text("Dont have an account? ")
                        .foregroundColor(Color.black)
                    Button("Sign up") {
                        self.currentPage = 0
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentPage: .constant(0))
    }
}
