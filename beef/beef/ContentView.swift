//
//  ContentView.swift
//  beef
//
//  Created by abe on 4/10/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn: Bool

    @ViewBuilder
    var body: some View {
        if isLoggedIn {
            BFTabView()
        } else {
            OnboardingView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLoggedIn: false)
    }
}
