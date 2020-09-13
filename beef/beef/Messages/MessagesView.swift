//
//  MessagesView.swift
//  beef
//
//  Created by abe on 6/9/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    @State var show = false
    var body: some View {
        NavigationView {
            List {
                Text("Message 1")
                .listRowBackground(Color("background"))
                .background(Color("background"))
            }
            .listSeparatorStyleNone()
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        print("SF Symbol button pressed...")
                    }) {
                        Image("dm").imageScale(.large)
                    }
                    Text("Messages")
                        .font(.system(size: 34))
                        .fontWeight(.medium)
                        .foregroundColor(Color("titleColor"))
                        .padding(screen.width/5.5)
                }
                ,
                                trailing:
                Button(action: {
                    self.show.toggle()
                }) {
                    Image("create_msg").imageScale(.large)
                }
            )
                .sheet(isPresented: $show) {                     CreateBeefView()
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
