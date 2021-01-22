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
            
    let dataStorage = DataStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let settings = Settings()
//        gameTimeTextField.text = String(settings.gameTime)
//        maxBubbleTextField.text = String(settings.maxBubble)
        gameTimeTextField.text = String(dataStorage.gameTime)
        maxBubbleTextField.text = String(dataStorage.maxBubble)
    }
    
    @IBAction func saveSettings(_ sender: Any) {
//        let settings = Settings()
//        settings.setGameTime(gameTimeTextField.text)
//        settings.setMaxBubble(maxBubbleTextField.text)
        
        dataStorage.setGameTime(gameTimeTextField.text)
        dataStorage.setMaxBubble(gameTimeTextField.text)
        self.viewDidLoad()
    }
        
}
