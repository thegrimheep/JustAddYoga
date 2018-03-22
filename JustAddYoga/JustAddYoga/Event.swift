//
//  Event.swift
//  JustAddYoga
//
//  Created by David Porter on 3/22/18.
//  Copyright © 2018 David Porter. All rights reserved.
//

import Foundation

class Event {
    let name : String
    let description : String
    let id : String
    var user : User?
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String, let description = json["description"] as? String, let id = json["id"] as? String {
            self.name = name
            self.description = description
            self.id = id
            if let userDictionary = json["user"] as? [String: Any] {
                self.user = User(json: userDictionary)
            }
        } else {
            return nil
        }
    }
}
