import SwiftUI
import Foundation

struct InterestsCollectionView: View {
    var interest: Interest
    let gradient = Gradient(colors: [.black, .clear])

    var body: some View {
        HStack(spacing: 32) {
            ForEach(0..<2) { items in
                InterestView(text: self.interest.name ?? "")
            }
        }.background(Color.black)
    }
}

struct InterestsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsCollectionView(interest: .init(name: "Relationships"))
    }
}

