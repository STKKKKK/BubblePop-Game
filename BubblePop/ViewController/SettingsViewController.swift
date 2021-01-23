//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var gameTimeTextField: UITextField!
    @IBOutlet weak var maxBubbleTextField: UITextField!
              
    override func viewDidLoad() {
        super.viewDidLoad()

        let dataStorage = DataStorage()
        gameTimeTextField.text = String(dataStorage.gameTime)
        maxBubbleTextField.text = String(dataStorage.maxBubble)
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        let dataStorage2 = DataStorage()
        dataStorage2.setGameTime(gameTimeTextField.text)
        dataStorage2.setMaxBubble(maxBubbleTextField.text)
        self.viewDidLoad()
    }
        
}
