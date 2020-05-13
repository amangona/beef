//
//  ProfileView.swift
//  beef
//
//  Created by abe on 5/12/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settings: AuthSettings
    var body: some View {
        Button("Sign up") {
            self.settings.showAuthView = true
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
