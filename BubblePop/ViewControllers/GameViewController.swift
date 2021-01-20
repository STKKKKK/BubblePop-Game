//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var player: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        player = defaults.string(forKey: "newPlayer")
        print("GamePlayViewController:", player!)
    }
    
}
