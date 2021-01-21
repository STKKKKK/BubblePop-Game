//
//  Bubble.swift
//  BubblePop
//
//  Created by skk on 2021/1/21.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import Foundation
import UIKit

class Bubble: UIButton {
    
    let size = 50
    var score = 0
    
    init(x: Int, y: Int) {
        super.init(frame: CGRect(x: x, y: y, width: size, height: size))
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
        switch Int.random(in: 1...100) {
        case 1...40:
            self.backgroundColor = .red
            score = 1
        case 41...70:
            self.backgroundColor = .systemPink
            score = 2
        case 71...85:
            self.backgroundColor = .green
            score = 5
        case 86...95:
            self.backgroundColor = .blue
            score = 8
        default:
            self.backgroundColor = .black
            score = 10
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addTarget(self, action: Selector, for controlEvents: UIControl.Event) {
        <#code#>
    }
    
//    func gainScore() -> Int {
//        return score
//    }
    
    @IBAction func bubblePressed(_ sender: UIButton) {
        sender.removeFromSuperview()
        // update the player's score
        }
    }
    
//    func appear() {
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//            self.alpha = 0.8
//        })
//    }
//
//    func disappear() {
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
//            self.alpha = 0
//        }) { (_) in
//            self.removeFromSuperview()
//        }
//    }
//
//    func pop() {
//        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
//            self.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
//        }) { (_) in
//            self.removeFromSuperview()
//        }
//    }
    
}
