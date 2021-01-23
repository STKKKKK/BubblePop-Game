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
    
    var gameTime = 0
    let defaultGameTime = 60
    let minGameTime = 5
    let maxGameTime = 120
    
    var maxBubble = 0
    let defaultMaxBubble = 15
    let minMaxBubble = 5
    let maxMaxBubble = 20
    
    var newPlayer = "player"
  
    var gold = ""
    var silver = ""
    var bronze = ""
    
    init() {
        gameTime = defaults.integer(forKey: "gameTime")
        maxBubble = defaults.integer(forKey: "maxBubble")
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
        newPlayer = defaults.string(forKey: "newPlayer") ?? "???"
        
        gold = defaults.string(forKey: "gold") ?? ""
        silver = defaults.string(forKey: "silver") ?? ""
        bronze = defaults.string(forKey: "bronze") ?? ""
    }
    
    func setGameTime(_ inputText: String?) {
        gameTime = self.adjustSetting(inputText, minGameTime, maxGameTime)
        defaults.set(gameTime, forKey: "gameTime")
    }
    
    func setMaxBubble(_ inputText: String?) {
        maxBubble = self.adjustSetting(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(maxBubble, forKey: "maxBubble")
    }
    
    func setNewPlayer(_ inputText: String?) {
        newPlayer = self.adjustName(inputText)
        defaults.set(newPlayer, forKey: "newPlayer")
    }
    
    func getPlayerHighestScore() -> Int{
        return defaults.integer(forKey: newPlayer)
    }
    
    func setNewRecord(_ score: Int) {
        if score > getPlayerHighestScore() {
            defaults.set(score, forKey: newPlayer)
        }

        if score > defaults.integer(forKey: gold) {
            defaults.set(newPlayer, forKey: "gold")
            defaults.set(gold, forKey: "silver")
            defaults.set(silver, forKey: "bronze")
        } else if score > defaults.integer(forKey: silver) {
            defaults.set(newPlayer, forKey: "silver")
            defaults.set(silver, forKey: "bronze")
        } else if score > defaults.integer(forKey: bronze) {
            defaults.set(newPlayer, forKey: "bronze")
        }
    }
        
    func getHighRankScore(_ rank: String) -> Int {
        let player = defaults.string(forKey: rank) ?? ""
        return defaults.integer(forKey: player)
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
            if text.count == 0 {
                return "player"    // adjust empty input
            } else {
                return text
            }
        } else {
            return "???"  // adjust nil
        }
    }
    
}
