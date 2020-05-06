//
//  AuthView.swift
//  beef
//
//  Created by abe on 5/4/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel = AuthViewModel()
    var body: some View {
        SignInWithAppleToFirebase { response in
            print("response: ", response)
        }.frame(width: 240, height: 64)
//        Button("Signup") {
//            print("signing up")
//            self.viewModel.signup()
//
//
//        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
