//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGame(_ sender: Any) {
        if var name = nameTextField.text {
            if name.count == 0 {
                name = "Player"
            }
            let defaults = UserDefaults.standard
            defaults.set(name, forKey: "newPlayer")
        }
    }
}

