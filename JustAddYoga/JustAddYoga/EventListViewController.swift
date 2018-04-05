//
//  EventListViewController.swift
//  JustAddYoga
//
//  Created by David Porter on 3/22/18.
//  Copyright © 2018 David Porter. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        JSONParser.EventsFrom(data: JSONParser.sampleJSONData) { (success, events) in
            if (success) {
                guard let events = events else {
                    fatalError("Events came back nil")
                }
                
                for events in events {
                    print(events.description)
                }
            }
        }
    }


}
