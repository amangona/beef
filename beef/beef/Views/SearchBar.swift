
import SwiftUI

struct SearchBar: View {
    
    @State private var showCancelButton: Bool = false
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")

            TextField("search", text: $searchText, onEditingChanged: { isEditing in
                self.showCancelButton = true
            }, onCommit: {
                print("onCommit")
            }).foregroundColor(.primary)

            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
