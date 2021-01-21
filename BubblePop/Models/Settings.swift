//
//  Settings.swift
//  BubblePop
//
//  Created by skk on 2021/1/21.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

class Settings {
    
    var gameTime = 0
    let defaultGameTime = 60
    let minGameTime = 5
    let maxGameTime = 120
    
    var maxBubble = 0
    let defaultMaxBubble = 15
    let minMaxBubble = 5
    let maxMaxBubble = 20
    
    let defaults = UserDefaults.standard

    
    init() {
        gameTime = defaults.integer(forKey: "gameTime")
        maxBubble = defaults.integer(forKey: "maxBubble")
        
        // '0' means it is the FIRST time to use UserDefault by that key
        // '0' also means in the LAST update, the value has been set to default
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
    }
    
    func setGameTime(_ inputText: String?) {
        gameTime = adjust(inputText, minGameTime, maxGameTime)
        defaults.set(gameTime, forKey: "gameTime")
    }
    
    func setMaxBubble(_ inputText: String?) {
        maxBubble = adjust(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(maxBubble, forKey: "maxBubble")
    }
    
    // Adjust Invalid Input
    func adjust(_ inputText: String?, _ min: Int, _ max: Int) -> Int {
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
