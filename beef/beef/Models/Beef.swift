
import Foundation
import FirebaseFirestoreSwift

struct Beef: Identifiable, Codable {
    @DocumentID var id: String?
    let title: String
    let description: String
    let coverImageURL: String
    let points: [Point]?
}

extension Beef {
    static var sample: Beef {
        return Beef(id: "1", title: "Sample beef", description: "Sample description", coverImageURL: "https://firebasestorage.googleapis.com/v0/b/rush-dae0c.appspot.com/o/maxresdefault.jpg?alt=media&token=0423c290-6e75-41f8-87ce-209fcb3408f7", points: [Point.sample1, Point.sample2])
    }
}

struct Point: Identifiable, Codable {
    @DocumentID var id: String?
    let user: User?
    let text: String
    let score: Int
    let side: Int // This maybe a beef id. Doing this would make it so to have 
    let imageURLString: String?
    let urlString: String?
}

enum Side {
    case left
    case right
}

extension Point {
    static var sample1: Point {
       return Point(id: "1", user: nil, text: "This is an example point 1", score: 0, side: 0, imageURLString: nil, urlString: nil)
    }
    static var sample2: Point {
       return Point(id: "2", user: nil, text: "This is an example point 2", score: 0, side: 1, imageURLString: nil, urlString: nil)
    }
}
