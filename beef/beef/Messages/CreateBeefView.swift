//
//  CreateBeefView.swift
//  beef
//
//  Created by abe on 6/9/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI

struct CreateBeefView: View {
    @State private var showCancelButton: Bool = false
    @Binding var titleText: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add Title...", text: $titleText, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    print("onCommit")
                })
                    .foregroundColor(.primary)
                    .font(Font.system(size: 24, design: .default))
                
                Button(action: {
                    self.titleText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(titleText == "" ? 0 : 1)
                }
            }.padding()
            Spacer()
            
        }
        
        //        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        //        .foregroundColor(.secondary)
        //        .background(Color(.secondarySystemBackground))
        //        .cornerRadius(10.0)
    }
}

struct CreateBeefView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBeefView(titleText: .constant(""))
    }
}
