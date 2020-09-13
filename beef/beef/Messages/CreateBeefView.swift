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
    @State var titleText: String = ""
    @State var participants: [Contact] = []
    @State var show = false
    @State var selectedParticopants: [String:Contact?] = [:]
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
                    Image(systemName: "xmark.circle.fill").opacity(self.titleText == "" ? 0 : 1)
                }
            }.padding()
            HStack {
                Text("ME")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Circle())
                Rectangle()
                    .frame(width: 1.0, height: 16.0)
                ForEach(Array(selectedParticopants.values) as! [Contact]) { contact in
                    Text(String(contact.name.first!))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Circle())
                }
                Button(action: {
                    self.show.toggle()
                }) {
                    Image("add_participant").opacity(self.titleText == "" ? 0 : 1)
                }
                Spacer()
            }.padding()
            Spacer()
            
        }.sheet(isPresented: $show) {
            BeefContactsView(selected: self.$participants, selectedDict: self.$selectedParticopants)
        }
        
        //        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        //        .foregroundColor(.secondary)
        //        .background(Color(.secondarySystemBackground))
        //        .cornerRadius(10.0)
    }
}

struct CreateBeefView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBeefView()
    }
}
