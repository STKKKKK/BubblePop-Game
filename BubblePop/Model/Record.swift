//
//  Record.swift
//  BubblePop
//
//  Created by skk on 2021/1/22.
//  Copyright © 2021 Hong Kung. All rights reserved.
//


import Foundation

class Record {
    
    var player: String
    var score: Int
//    var rank = -1   // default rank
    
    init(_ player: String, _ score: Int) {
        self.player = player
        self.score = score
    }
    
//    init(_ player: String, _ score: Int, rank: Int) {
//        self.player = player
//        self.score = score
//        self.rank = rank
//    }
    
//    func setRank(_ rank: Int) {
//        self.rank = rank
//    }
//    
//    func dropRank() {
//        self.rank += 1
//    }
//
//    func discardRank() {
//        self.rank = -1
//    }
    
}
