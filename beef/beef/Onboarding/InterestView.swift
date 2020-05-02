//
//  InterestView.swift
//  beef
//
//  Created by abe on 5/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct InterestView: View {
    var text: String
    @State var selected: Bool = false
    
    var body: some View {
        ZStack{
            Color.black
            Button(action: {
                self.selected.toggle()
            }) {
               Text(text)
                .foregroundColor(selected ? .white : .black)
                .font(.system(size: 12))
                .padding(.vertical, 16.0)
                .padding(.horizontal, 32.0)
                .background(RoundedRectangle(cornerRadius: 50).foregroundColor(selected ? .red : .white))
            }
        }
    }
}

struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        InterestView(text: "Relationships")
    }
}
