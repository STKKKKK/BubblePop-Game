//
//  RecordStorage.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

class RecordStorage {
    
    let defaults = UserDefaults.standard
    
    var newPlayer = "???"
    var highScore = 0
    var records = ""
    
    
    init() {
        self.reload()
    }
    
    func reload() {
        newPlayer = defaults.string(forKey: Keys.newPlayer) ?? "???"
        highScore = defaults.integer(forKey: Keys.highScore)
        records = defaults.string(forKey: Keys.records) ?? ""
    }
    
    func setNewPlayer(_ inputText: String?) {
        newPlayer = self.adjustName(inputText)
        defaults.set(newPlayer, forKey: Keys.newPlayer)
    }
    
    // Adjust Invalid Input of Player Name Field
    func adjustName(_ inputText: String?) -> String {
        if let text = inputText {
            if text.contains("/") || text.contains(":") {
                return "???"    // adjust invalid character
            } else if text.count == 0 {
                return "player"   // adjust empty input
            } else {
                return text
            }
        } else {
            return "???"  // adjust nil
        }
    }
    
    
    func setNewRecord(_ newScore: Int) {
        records += newPlayer + ":\(newScore)/"
        
        var newRecords = ""
        var newPlayerHighScore = 0
        for record in records.split(separator: "/") {
            let subs = record.split(separator: ":")
            let player = String(subs[0])
            let score = Int(subs[1]) ?? 0
            if newPlayer != player {
                newRecords += player + ":\(score)/"
            } else if score > newPlayerHighScore {
                newPlayerHighScore = score
            }
        }
        newRecords += newPlayer + ":\(newPlayerHighScore)/"
        defaults.set(newRecords, forKey: Keys.records)
                
        if newScore > highScore {
            defaults.set(newScore, forKey: Keys.highScore)
        }
    }
    
    
    func getDecodeRecords() -> [Record] {
        var decodedRecords: [Record] = []
        for record in records.split(separator: "/") {
            let subs = record.split(separator: ":")
            let player = String(subs[0])
            let score = Int(subs[1]) ?? 0
            decodedRecords.append(Record(player, score))
        }
        return decodedRecords
    }
    
}
