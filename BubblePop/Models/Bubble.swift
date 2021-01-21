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
    
    let size = 80
    
    init(x: Int, y: Int, color: UIColor) {
        super.init(frame: CGRect(x: x, y: y, width: size, height: size))
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appear() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 0.8
        })
    }
    
    func disappear() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    func pop() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
}
