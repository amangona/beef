//
//  OnboardingButton.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct OnboardingButton: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical, 16.0)
                .padding(.horizontal, 64.0)
                .background(RoundedRectangle(cornerRadius: 14).foregroundColor(.red))
        }
    }
    
    
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(title: "Get Started")
    }
}
