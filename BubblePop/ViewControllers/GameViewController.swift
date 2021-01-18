//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/18.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let player = name {
            print("GamePlayViewController:", player)
        } else {
            print("failed")
        }
    }


}

