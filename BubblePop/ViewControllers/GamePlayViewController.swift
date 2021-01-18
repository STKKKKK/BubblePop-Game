//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/16.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("GamePlayViewController:", name)
        
//        let defaults = UserDefaults.standard
//        name = defaults.string(forKey: "PlayerName") ?? "Default Name"
        
        nameLabel.text = "Hello \(name)"
    }


}


