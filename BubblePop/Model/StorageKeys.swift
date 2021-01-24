//
//  StorageKeys.swift
//  BubblePop
//
//  Created by skk on 2021/1/24.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

struct Keys {
    
    // Keys for the userDefault EXCEPT player records
//    case gameTime, maxBubble
//    case newPlayer
//    case gold, silver, bronze
    static let list = ["gameTime", "maxBubble", "newPlayer", "gold", "silver", "bronze"]
    
    static let gameTime = list[0]
    static let maxBubble = list[1]
    
    static let newPlayer = list[2]
    
    static let gold = list[3]
    static let silver = list[4]
    static let bronze = list[5]
    
}
