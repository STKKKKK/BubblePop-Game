//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {

    @IBOutlet weak var scoreTabelView: UITableView!
    
    let recordStorage = RecordStorage()
    var records: [Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        records = bubbleSortRecords(recordStorage.getDecodeRecords())
    }
}


extension ScoreboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)

        let index = indexPath.row
        let record = records[index]

        cell.textLabel?.text = record.player
        cell.detailTextLabel?.text = String(record.score)
        return cell
    }
}
