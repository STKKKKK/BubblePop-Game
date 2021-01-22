//
//  calculate.swift
//  BubblePop
//
//  Created by skk on 2021/1/23.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation

public func toNearestInteger(_ num: Double) -> Int {
    if num - Double(Int(num)) < 0.5 {
        return Int(num)
    } else {
        return Int(num) + 1
    }
}

public func bubbleSortRecords(_ records: [Record]) -> [Record] {
    
}
