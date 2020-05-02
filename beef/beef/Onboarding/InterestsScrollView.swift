//
//  InterestsScrollView.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct InterestsScrollView: View {
    var interests: [Interest]
    let gradient = Gradient(colors: [.black, .clear])
    var body: some View {
        ZStack {
            
            ScrollView(.vertical) {
                ForEach(interests) { items in
                    ForEach(0..<2) { _ in
                        InterestsCollectionView(interest: items)
                    }
                }
            }.disabled(false)
            VStack {
                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                .frame(height: 30)
                Spacer()
                LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
                    .frame(height: 30)
            }.disabled(true)
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct InterestsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsScrollView(interests: Interest.sample())
    }
}
