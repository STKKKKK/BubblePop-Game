//
//  SettingsStorage.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

class SettingStorage {
    
    let defaults = UserDefaults.standard
    
    var gameTime = 0
    let defaultGameTime = 60
    let minGameTime = 5
    let maxGameTime = 120
    
    var maxBubble = 0
    let defaultMaxBubble = 15
    let minMaxBubble = 5
    let maxMaxBubble = 20
    
    
    init() {
        self.reload()
    }
    
    func reload() {
        gameTime = defaults.integer(forKey: Keys.gameTime)
        maxBubble = defaults.integer(forKey: Keys.maxBubble)
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
    }
    
    func setGameTime(_ inputText: String?) {
        gameTime = self.adjustSetting(inputText, minGameTime, maxGameTime)
        defaults.set(gameTime, forKey: Keys.gameTime)
    }
    
    func setMaxBubble(_ inputText: String?) {
        maxBubble = self.adjustSetting(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(maxBubble, forKey: Keys.maxBubble)
    }
    
    // Adjust Invalid Input of a Setting Field
    func adjustSetting(_ inputText: String?, _ min: Int, _ max: Int) -> Int {
        if let text = inputText {
            if var int = Int(text) {
                if int < min {
                    int = min   // adjust too-small input to minimum
                } else if int > max {
                    int = max   // adjust too-large input to maximum
                }
                return int
            } else {
                return 0    // adjust non-integer input to default
            }
        } else {
            return 0    // adjust nil to default
        }
    }
    
}
