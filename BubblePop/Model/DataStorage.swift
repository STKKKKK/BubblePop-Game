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
    
    var newPlayer: String?
   // var highScore = 0
    var records: [Record] = []
    
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
       // highScore = defaults.integer(forKey: "highScore")
        if let rc = defaults.array(forKey: "records") as? [Record] {
            records = bubbleSortRecords(rc)
        }
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
    
    func setNewRecord(_ score: Int) {
        if let player = newPlayer {
            let index = playerExistAt(player)
            if index == -1 {
                records.append(Record(player, score))
            } else if score > records[index].score {
                records[index] = Record(player, score)
            }
            defaults.set(records, forKey: "records")
        }
    }
    
    func playerExistAt(_ player: String) -> Int{
        if records.count == 0 {
            return -1   // player not exist
        }
        for i in 0...records.count-1 {
            if records[i].player == player {
                return i
            }
        }
        return -1  // player not exist
    }
    
//    func setNewRecord(_ score: Int) {
//        if let player = newPlayer {
//            // defaults.set(score, forKey: player)
//
//
//            let newRecord = Record(player, score)
//
//            for record in records {
//                if newRecord.score == record.score {
//                    newRecord.setRank(record.rank)
//                    break
//                } else if newRecord.score > record.score {
//                    if newRecord.rank < record.rank {
//                        newRecord.setRank(record.rank)
//                    }
//                    record.dropRank()
//                }
//
//
//
//                if newRecord.score > record.score {
//                    if newRecord.rank < record.rank {
//                        newRecord.setRank(record.rank)
//                    }
//                    record.dropRank()
//                } else if newRecord.score == record.score {
//                    newRecord.setRank(record.rank)
//                    break
//                }
//            }
//            if newRecord.rank == -1 {
//
//            }
//            records.append(newRecord)
//
//            defaults.set(records, forKey: "records")
//        }
//    }
    
//    func setHighScore(_ score: Int) {
//        defaults.set(score, forKey: "highScore")
//    }
//
//    func getScoreList() -> [Int]{
//        var ScoreList: [Int] = []
//        for record in records {
//            ScoreList.append(record.score)
//        }
//        return ScoreList
//    }
//
//    func getNameList() {
//
//    }
//
//    func getHighRecords(rankBefore: Int) {
//        var highRecords: [Record] = []
//        var scoreList = getScoreList()
//        for _ in 1...rankBefore {
//            let max = scoreList.max()
//            scoreList = scoreList.filter{ $0 != max }
//            for record in records {
//                if record.score == max {
//                    highRecords.append(record)
//                    scoreList.re
//                }
//            }
//        }
//    }

//    func getRecords(byRanks: [Int]) {
//        var tempRecords = records
//        var i = 0
//        while i < tempRecords.count-1 {
//            var j = 0
//            while j < tempRecords.count-1-i {
//                if tempRecords[j+1].score < tempRecords[j].score {
//                    let temp = tempRecords[j]
//                    tempRecords[j] = tempRecords[j+1]
//                    tempRecords[j+1] = temp
//                }
//            }
//        }
//    }
        
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
            return "player"  // adjust nil
        }
    }
    
}
