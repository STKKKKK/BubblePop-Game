//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class ScoreboardViewController: UITableViewController {

    let dataStorage = DataStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as! RecordTableViewCell
        
        let records = dataStorage.records.sorted
        
//        for record in records {
//
//            if record.score <
//        }
        let record = records[indexPath.row]
        cell.playerLabel.text = record.player
        cell.scoreLabel.text = "\(record.score)"
        return cell
    }
    
    func sortRecords(_ records: [Record]) -> [Record] {
        var temp = -1
        for record in records {
            if record.score > temp {
                temp = record.score
            }
        }
    }
}
