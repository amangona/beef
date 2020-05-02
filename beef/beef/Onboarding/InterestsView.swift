//
//  InterestView.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct InterestsView: View {
    @Binding var isLoggedIn: Bool
    var interests: [Interest] = Interest.sample()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                VStack {
                    VStack {
                        Text("Choose your interest")
                            .font(.system(size: 42))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 88)
                            .padding(.bottom, 10)
                        HStack {
                            Text("Get personalized recommendations to suit your drama needs ")
                                .font(.system(size: 12))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 24.0)
                        }
                    }.background(Color.black)
                    InterestsScrollView(interests: interests)
                    OnboardingButton(title: "Start Beefing")
                        .padding(.bottom, 129.0)
                        .padding(.top, 40)
                }
                .padding(.top, 100.0)
                
            }
            .navigationBarItems(trailing:
                Button("Skip") {
                    self.isLoggedIn.toggle()
                }.foregroundColor(.white)
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct InterestsViews_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView(isLoggedIn: .constant(false))
    }
}
