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

func bubbleSortRecords(_ inputRecords: [Record]) -> [Record] {
    var records = inputRecords
    var i = 0
    while i < records.count-1 {
        var j = 0
        while j < records.count-1-i {
            if records[j+1].score < records[j].score {
                let temp = records[j]
                records[j] = records[j+1]
                records[j+1] = temp
            }
            j += 1
        }
        i += 1
    }
    return records.reversed()
}
