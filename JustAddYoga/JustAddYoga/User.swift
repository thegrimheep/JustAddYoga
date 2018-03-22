//
//  User.swift
//  JustAddYoga
//
//  Created by David Porter on 3/22/18.
//  Copyright © 2018 David Porter. All rights reserved.
//

import Foundation

class User {
    let name: String
    let profileImageUrl: String
    let location: String
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String,
            let profileImageUrl = json["profile_image_url"] as? String,
            let location = json["location"] as? String {
            
            self.name = name
            self.profileImageUrl = profileImageUrl
            self.location = location
            
        } else {
            return nil
        }
    }
}
