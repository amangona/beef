//
//  AuthView.swift
//  beef
//
//  Created by abe on 5/4/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    //    @ObservedObject var viewModel = AuthViewModel()
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            Button(action: {
                print("handle closing..")
            }) {
                HStack {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                .frame(height: 48/3, alignment: .leading)
                .padding(.top, 28.0)
                .padding()
            }
            PagerView(pageCount: 2, currentIndex: self.$currentPage) {
                SignupView(currentPage: $currentPage)
                LoginView(currentPage: $currentPage)
            }
            //                HStack() {
            //
            //                    SignupView()
            //                        .position(x: geometry.size.width/2, y: geometry.size.height/2)
            //                    LoginView()
            //                        .position(x: geometry.size.width)
            //
            //                }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}


