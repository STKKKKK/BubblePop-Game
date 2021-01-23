//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {

    // @IBOutlet var recordTabelView: UITableView!
    
    let dataStorage = DataStorage()
    
    var records: [Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        records = dataStorage.records
//        self.tableView.reloadData()
//        self.tableView.tableFooterView = UIView()
    }
}
    
//extension ViewController: UITableViewDataSource {
//    let dataStorage = DataStorage()
//
//    var records: [Record] = []
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return records.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
//
//        let record = records[indexPath.row]
//        cell.playerLabel.text = record.player
//        cell.scoreLabel.text = String(record.score)
//        return cell
//    }
//
//}
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return records.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as! RecordTableViewCell
//
//        let record = records[indexPath.row]
//        cell.playerLabel.text = record.player
//        cell.scoreLabel.text = String(record.score)
//        return cell
//    }
    
// }
