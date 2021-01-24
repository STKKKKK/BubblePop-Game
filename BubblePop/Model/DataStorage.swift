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
    
    var newPlayer = "???"
    var highScore = 0
    var records = ""

    
    init() {
        gameTime = defaults.integer(forKey: Keys.gameTime)
        maxBubble = defaults.integer(forKey: Keys.maxBubble)
        if gameTime == 0 {
            gameTime = defaultGameTime
        }
        if maxBubble == 0 {
            maxBubble = defaultMaxBubble
        }
        
        newPlayer = defaults.string(forKey: Keys.newPlayer) ?? "???"
        highScore = defaults.integer(forKey: Keys.highScore)
        records = defaults.string(forKey: Keys.records) ?? ""
    }
    
    func setGameTime(_ inputText: String?) {
        gameTime = self.adjustSetting(inputText, minGameTime, maxGameTime)
        defaults.set(gameTime, forKey: Keys.gameTime)
    }
    
    func setMaxBubble(_ inputText: String?) {
        maxBubble = self.adjustSetting(inputText, minMaxBubble, maxMaxBubble)
        defaults.set(maxBubble, forKey: Keys.maxBubble)
    }
    
    func setNewPlayer(_ inputText: String?) {
        newPlayer = self.adjustName(inputText)
        defaults.set(newPlayer, forKey: Keys.newPlayer)
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
    func adjustName(_ inputText: String?) -> String {
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
    
    
    func setNewRecord(_ newScore: Int) {
        records += newPlayer + ":\(newScore)#"
        
        var newRecords = ""
        var newPlayerHighScore = 0
        for record in records.split(separator: "#") {
            let subs = record.split(separator: ":")
            let player = String(subs[0])
            let score = Int(subs[1]) ?? 0
            if newPlayer != player {
                newRecords += player + ":\(score)#"
            } else if score > newPlayerHighScore {
                newPlayerHighScore = score
            }
        }
        newRecords += newPlayer + ":\(newPlayerHighScore)#"
        defaults.set(newRecords, forKey: Keys.records)
                
        if newScore > highScore {
            defaults.set(newScore, forKey: Keys.highScore)
        }
    }
    
    
    func getDecodeRecords() -> [Record] {
        var decodedRecords: [Record] = []
        for record in records.split(separator: "#") {
            let subs = record.split(separator: ":")
            let player = String(subs[0])
            let score = Int(subs[1]) ?? 0
            decodedRecords.append(Record(player, score))
        }
        return decodedRecords
    }
    
}
