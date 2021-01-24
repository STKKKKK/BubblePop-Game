//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/24.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    let records = RecordStorage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGame(_ sender: Any) {
        records.setNewPlayer(nameTextField.text)
    }
    
}

