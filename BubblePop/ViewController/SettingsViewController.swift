//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var gameTimeTextField: UITextField!
    @IBOutlet weak var maxBubbleTextField: UITextField!
    
    let settings = SettingStorage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTimeTextField.text = String(settings.gameTime)
        maxBubbleTextField.text = String(settings.maxBubble)
    }

    @IBAction func saveSettings(_ sender: Any) {
        settings.setGameTime(gameTimeTextField.text)
        settings.setMaxBubble(maxBubbleTextField.text)
        settings.reload()
        self.viewDidLoad()
    }
    
}
