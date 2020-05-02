//
//  BFTabView.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct BFTabView: View {
    var body: some View {
        TabView {
            Text("Beef")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Beef")
            }.tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Search")
            }.tag(1)
            Text("Create")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Create")
            }.tag(3)
            Text("Notification")
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Search")
            }.tag(4)
            Text("Profile")
                .tabItem {
                    Image(systemName: "5.circle")
                    Text("Profile")
            }.tag(5)
        }
    }
}

struct BFTabView_Previews: PreviewProvider {
    static var previews: some View {
        BFTabView()
    }
}
