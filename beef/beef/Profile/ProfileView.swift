//
//  ProfileView.swift
//  beef
//
//  Created by abe on 5/12/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {    
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            Button("Sign up") {
                viewStore.send(.someAction)
            }
        }
        //        HStack {
        //            Button("Sign up") {
        //
        ////                self.settings.wrappedValue.showAuthView = true
        //
        //            }
        //            Text("Protected")
        //            .titleStyle()
        //
        ////            Button("Sign up2") {
        ////                self.settings2.showAuthView = true
        ////            }
        //        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            store: Store(
                initialState: AppState(),
                reducer: appReducer,
                environment: AppEnvironment())
        )
    }
}
