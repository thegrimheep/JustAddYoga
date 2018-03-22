//
//  JSONParser.swift
//  JustAddYoga
//
//  Created by David Porter on 3/22/18.
//  Copyright © 2018 David Porter. All rights reserved.
//

import Foundation

typealias JSONParserCallback = (Bool, [Event]?)->()

class JSONParser {
    
    static var sampleJSONData : Data {
        guard let eventJSONPath = Bundle.main.url(forResource: "event", withExtension: "json") else {
            fatalError("Event.json does not exsist in this bundle")
        }
        do {
            let eventJSONData = try Data (contentsOf: eventJSONPath)
            return eventJSONData
        } catch {
            fatalError("Failed to create data from evenJSONPath")
        }
    }
    class func EventsFrom(data: Data, callback: JSONParserCallback) {
        
        do{
            if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] {
                var events = [Event]()
                
                for eventDictionary in rootObject {  //root object here is an array of objects representing the events
                    if let event = Event(json: eventDictionary) {
                        events.append(event)
                    }
                }
                callback(true, events)
            }
        } catch {
            print("Error Serializing JSON")
            callback(false, nil)
        }
    }
}
