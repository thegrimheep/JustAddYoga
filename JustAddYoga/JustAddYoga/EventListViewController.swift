//
//  EventListViewController.swift
//  JustAddYoga
//
//  Created by David Porter on 3/22/18.
//  Copyright © 2018 David Porter. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        JSONParser.EventsFrom(data: JSONParser.sampleJSONData) { (success, events) in
            if (success) {
                guard let events = events else {
                    fatalError("Events came back nil")
                }
                
                for event in events {
                    print(event.name)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //setting space between cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Indexpath: \(indexPath.row)"
        //adding card effect
        cell.layer.cornerRadius = 5
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowColor = UIColor.black.cgColor
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
