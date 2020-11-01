//
//  TableViewController.swift
//  sample
//
//  Created by admin on 10/31/20.
//  Copyright © 2020 team9. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var model = LeaderBoard()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
            fatalError("Expected UITableViewCell")
        }
        
        let scores: [NSManagedObject] = model.sortedScores()
        if let score = scores[indexPath.row] as? Score {
            cell.textLabel?.text = score.value(forKey: "name") as? String
            cell.detailTextLabel?.text = score.value(forKey: "score") as? String
        }

        return cell
    }
    

}
