//
//  BeefCaontactsView.swift
//  beef
//
//  Created by abe on 6/10/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import Contacts

struct BeefContactsView: View {
    
    @ObservedObject var contacts = Contacts()
    @State var searchText = ""
    @Binding var selected: [Contact]
//    @Binding var selectedDict: [String:Contact]
    var selection: (([Contact]) -> ())?

    @Binding var selectedDict: [String:Contact?]
    var body: some View {
        VStack {
            Text("Who do you have beef with?")
                .padding()
            Spacer()
            SearchBar(searchText: self.$searchText)
                .padding()
            List {
                ForEach(contacts.contacts) { contact in
                    
                    ContactView(contact: contact) { selectedContact in
                        print("selected: ", selectedContact.name)
//                        if selectedDict[selectedContact.name]
//                        if self.selected.contains(selectedContact) {
//                            print("contain")
////                            for (index ,value) in self.selected.enumerated() {
////                                print("the loop")
////                                if value == selectedContact {
////                                    self.selected.remove(at: index)
////                                }
////                            }
//                        } else {
//                            print("no contain")
//                            self.selected.append(selectedContact)
//                        }
                    }.onTapGesture {
//                        contact.selected.toggle()
                        if self.selectedDict[contact.name] == nil {
                            self.selectedDict[contact.name] = contact
                        } else {
                            self.selectedDict[contact.name] = nil
                        }
//                        let contact = selectedDict.values

//                        print("Tapped", contact.name, contact.selected)
//                        contact.selected.toggle()
                        ///Use the dictionary here
//                        contact.selection()
                    }
                    
                }
            }.listSeparatorStyleNone()
        }
        
    }
}

struct BeefContactsView_Previews: PreviewProvider {
    static var previews: some View {
        BeefContactsView(selected: .constant([]), selectedDict: .constant(["key": nil]))
    }
}

struct ContactView: View {
    @ObservedObject var contact: Contact
    var selection: ((Contact) -> ())
    @State var selected = false
    var body: some View {
        HStack {
            Image(uiImage: (contact.image ?? UIImage(systemName: "person.crop.circle"))!).resizable().scaledToFit()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(.headline))
                Text(contact.number)
                    .font(.system(.subheadline))
            }
            Spacer()
            if contact.selected {
                Image(systemName: "circle.fill")

            } else {
                Image(systemName: "circle")
            }
           
        }
//        .onTapGesture {
//                    print("we here!!!", self.contact.name)
//                    // Consider case removal
//                    self.selected.toggle()
//                    self.selection(self.contact)
//                }
    .padding()
//        .border(Color.red, width: 2)
        
    }
}

class Contact: Identifiable, Equatable, ObservableObject {
    
    var id: UUID = UUID()
    var name: String
    var number: String
    var image: UIImage?
    @Published var selected: Bool = false
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name == rhs.name && lhs.number == rhs.number
    }
}


class Contacts: ObservableObject {
    
    @Published var contacts: [Contact] = []
    
    init() {
        fetchContacts { (contacts) in
            contacts.forEach {
                //print("dates: ", $0.thu)
                
                let number = $0.phoneNumbers.first?.value.stringValue
                let name = $0.givenName
                var contact = Contact(name: name, number: number ?? "")
                if $0.imageDataAvailable {
                    contact.image = UIImage(data: $0.thumbnailImageData ?? Data())
                }
                self.contacts.append(contact)
            }
        }
    }
    
    let store = CNContactStore()
    
    func fetchContacts(completion: ([CNContact]) -> ()) {
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactNamePrefixKey,
            CNContactGivenNameKey,
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey,
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey,
            CNContactDatesKey] as [CNKeyDescriptor]

        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }

        var results: [CNContact] = []

        // Iterate all containers and append their contacts to our results array
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

            do {
                let containerResults = try? store.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)
                completion(containerResults!)
//                results.append(containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }

//        return results
    }

}


