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
    
//    var gameTime = 0
//    var maxBubble = 0
    
    let defaultGameTime = 60
    let defaultMaxBubble = 15
    let minGameTime = 5
    let minMaxBubble = 5
    let maxGameTime = 120
    let maxMaxBubble = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        var gameTime = defaults.integer(forKey: "gameTime")
        var maxBubble = defaults.integer(forKey: "maxBubble")
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
        gameTimeTextField.text = String(gameTime)
        maxBubbleTextField.text = String(maxBubble)
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        let gameTime = adjust(gameTimeTextField.text, minGameTime, maxGameTime)
        let maxBubble = adjust(maxBubbleTextField.text, minMaxBubble, maxMaxBubble)
        
        let defaults = UserDefaults.standard
        defaults.set(gameTime, forKey: "gameTime")
        defaults.set(maxBubble, forKey: "maxBubble")
        
        self.viewDidLoad()
    }
    
    func adjust(_ input: String?, _ min: Int, _ max: Int) -> Int{
        if let text = input {
            if var int = Int(text) {
                if int < min {
                    int = min
                } else if int > max {
                    int = max
                }
                return int
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
}
