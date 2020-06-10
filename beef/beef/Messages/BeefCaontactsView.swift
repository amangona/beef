//
//  BeefCaontactsView.swift
//  beef
//
//  Created by abe on 6/10/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import SwiftUI
import Contacts

struct BeefCaontactsView: View {
    
    @ObservedObject var contacts = Contacts()
    @State var searchText = ""
    var body: some View {
        VStack {
            Text("Who do you have beef with")
                .padding()
            Spacer()
            SearchBar(searchText: self.$searchText)
            List {
                ForEach(contacts.contacts) { contact in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.system(.headline))
                            Text(contact.number)
                                .font(.system(.subheadline))
                        }
                    }
                    
                }
            }.listSeparatorStyleNone()
        }
        
    }
}

struct BeefCaontactsView_Previews: PreviewProvider {
    static var previews: some View {
        BeefCaontactsView()
    }
}

struct Contact: Identifiable {
    var id: UUID = UUID()
    var name: String
    var number: String
    var image: UIImage!
}


class Contacts: ObservableObject {
    
    @Published var contacts: [Contact] = []
    
    init() {
        fetchContacts { (contacts) in
            contacts.forEach {
                print("dates: ", $0.imageDataAvailable)
                
                let number = $0.phoneNumbers.first?.value.stringValue
                let name = $0.givenName
                var contact = Contact(name: name, number: number ?? "")
//                if $0.imageDataAvailable {
//                    contact.image = UIImage(data: $0.imageData ?? Data())
//                }
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
