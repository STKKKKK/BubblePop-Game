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
        self.gameTime = defaults.integer(forKey: "gameTime")
        self.maxBubble = defaults.integer(forKey: "maxBubble")
        if self.gameTime == 0 {
            self.gameTime = defaultGameTime
        }
        if self.maxBubble == 0 {
            self.maxBubble = defaultMaxBubble
        }
    }
    
    func saveGameTime(_ inputText: String?) {
        self.gameTime = adjust(inputText, minGameTime, maxGameTime)
        defaults.set(self.gameTime, forKey: "gameTime")
    }
    
    func saveMaxBubble(_ inputText: String?) {
        self.maxBubble = adjust(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(self.maxBubble, forKey: "maxBubble")
    }
    
    func adjust(_ inputText: String?, _ min: Int, _ max: Int) -> Int {
        if let text = inputText {
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
