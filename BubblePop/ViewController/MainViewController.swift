//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGame(_ sender: Any) {
        let records = RecordStorage()
        records.setNewPlayer(nameTextField.text)
    }

}

