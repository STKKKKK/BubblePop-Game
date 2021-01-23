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
    
    let dataStorage = DataStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startGame(_ sender: Any) {
        dataStorage.setNewPlayer(nameTextField.text)
    }
}

