//
//  FirebaseAPIHelper.swift
//  
//
//  Created by Will Oakley on 10/24/18.
//

import Foundation
import FirebaseStorage
import Firebase

class FirebaseAPIClient {
    
    static func getSnaps(completion: @escaping ([SnapImage]) -> ()) {
        /* PART 2A START */
        var snaps = [SnapImage]()
        let dataRef = Database.database().reference().child("snapImages").observeSingleEvent(of: .value, with: { (snapshot) in
            let image = snapshot.value as? [String:Any] ?? [:]
            let imageURL = image["imageURL"]
            let storageRef = Storage.storage().reference(forURL: imageURL as! String)
            storageRef.downloadURL(completion: {(url, error) in
                let data = Data(contentsOf: url!)
                let myImage = UIImage(data: data)
                let mySnap = SnapImage(sentBy: image["sentBy"], sentTo: image["sentTo"]
                    ], timeSent: image["timeSent"], image: myImage)
                snaps.append(mySnap)
            })
            completion([SnapImage])
    }
}
