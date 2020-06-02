
import Foundation
import Firebase
class BFService {
    static let shared = BFService()
    var db = Firestore.firestore()
    
    
    
    func getAllBeefs(completion: @escaping (([Beef]?) -> ())) {
        var beefs: [Beef] = []
        db.collection("beefs").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                completion(nil)
                return
            }
            beefs = documents.compactMap { queryDocumentSnapshot -> Beef? in
                return try? queryDocumentSnapshot.data(as: Beef.self)
            }
            completion(beefs)
        }
    }
}
