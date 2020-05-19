//
//  AuthButton.swift
//  beef
//
//  Created by abe on 5/12/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct AuthButton: View {
    var authType: AuthType
    var viewStore: ViewStore<AppState, AppAction>?
    
    var body: some View {
        Button(action: {
            self.viewStore?.send(.auth(type: self.authType))
        }) {
            HStack {
                self.authType.image
                    .resizable()
                    .scaledToFit()
                self.authType.text
                    .font(.system(size: 40/3))
                    .fontWeight(.bold)
            }
            .frame(width: 933/3, height: 130/3)
            .foregroundColor(.black)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
        }
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(authType: .snapchat)
    }
}
