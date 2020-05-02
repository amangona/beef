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
                    NavigationLink(destination: InterestsView(isLoggedIn: $isLoggedIn)) {
                        OnboardingButton(title: "Get Started")
                    }
                    Spacer()
                }

            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isLoggedIn: .constant(false))
    }
}
