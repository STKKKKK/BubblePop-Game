//
//  DataStorage.swift
//  BubblePop
//
//  Created by skk on 2021/1/22.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

class DataStorage {
    
    let defaults = UserDefaults.standard
    
    // In fact, this is the key list except recorded players name.
    let keyList = ["gameTime", "maxbubble", "newPlayer", "highScore"]
    
    var gameTime = 0
    let defaultGameTime = 60
    let minGameTime = 5
    let maxGameTime = 120
    
    var maxBubble = 0
    let defaultMaxBubble = 15
    let minMaxBubble = 5
    let maxMaxBubble = 20
    
    var newPlayer: String?
    
    var highScore = 0
    
    
    init() {
        gameTime = defaults.integer(forKey: "gameTime")
        maxBubble = defaults.integer(forKey: "maxBubble")
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
        newPlayer = defaults.string(forKey: "newPlayer")
        // records = defaults.dictionary(forKey: "records")
        highScore = defaults.integer(forKey: "highScore")
    }
    
    func setGameTime(_ inputText: String?) {
        gameTime = adjustSetting(inputText, minGameTime, maxGameTime)
        defaults.set(gameTime, forKey: "gameTime")
    }
    
    func setMaxBubble(_ inputText: String?) {
        maxBubble = adjustSetting(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(maxBubble, forKey: "maxBubble")
    }
    
    func setNewPlayer(_ inputName: String) {
        newPlayer = adjustName(inputName)
        defaults.set(newPlayer, forKey: "newPlayer")
    }
    
    func setNewRecord(_ score: Int) {
        if let player = newPlayer {
            defaults.set(score, forKey: player)
        }
    }
    
    func setHighScore(_ score: Int) {
        defaults.set(score, forKey: "highScore")
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
    
    // Adjust Invalid Input of Player Name Field
    func adjustName(_ inputText: String?) -> String{
        if let text = inputText {
            if defaults.object(forKey: text) != nil {
                return text + "1"   // adjust exist player name
            } else if keyList.contains(text){
                return text + "00"  // adjust to not conflict non-player keys
            } else if text.count == 0 {
                return "player"    // adjust empty input
            } else {
                return text
            }
        } else {
            return "player"  // adjust nil
        }
    }
    
}
