//
//  MenuViewModel.swift
//  ReadyMade
//
//  Created by Mehdi Hussain on 9/28/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class MenuViewModel: ObservableObject {
    @Published var list = [Menu]()
    
    func getMenuData() {
        let db = Firestore.firestore()
        db.collection("menu").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return Menu(id: d.documentID, items: d["items"] as? String ?? "", price: d["price"] as? Float ?? 5)
                        }
                    }
                }
            } else {
                print(error)
            }
            
            
        }
    }
}
