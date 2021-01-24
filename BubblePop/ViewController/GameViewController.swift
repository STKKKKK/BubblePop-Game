//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/25.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
        
    let bubbleSize = 50
    let bubbleUpdateRate = 0.35
    
    var player: String?
    var timer = Timer()
    var timeLeft = 0
    var currentScore = 0
    var highScore = 0
    var maxBubble = 0
    var lastPressedColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = SettingStorage()
        let records = RecordStorage()
        player = records.newPlayer
        print("Game Start for: \(player!)")
        
        highScore = records.highScore
        timeLeft = settings.gameTime
        maxBubble = settings.maxBubble
        
        timeLabel.text = String(timeLeft)
        scoreLabel.text = String(currentScore)
        highScoreLabel.text = String(highScore)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.updateTime()
            self.removeBubbles()
            self.addBubbles()
            if self.timeLeft == 0 {
                self.removeAllBubbles()
            }
        }
    }

    func updateTime() {
        timeLeft -= 1
        timeLabel.text = String(timeLeft)
        
        if timeLeft == 0 {
            timer.invalidate()
            print("Game over!")
            let records = RecordStorage()
            records.setNewRecord(currentScore)
        }
    }
        
    func removeAllBubbles() {
        for bubble in bubbleView.subviews {
            bubble.removeFromSuperview()
        }
    }
        
    func removeBubbles() {
        for bubble in bubbleView.subviews {
            if Double.random(in: 0...100) < bubbleUpdateRate*100 {
                bubble.removeFromSuperview()
            }
        }
    }
        
    func addBubbles() {
        let minX = Int(bubbleView.frame.minX) + bubbleSize/2
        let maxX = Int(bubbleView.frame.maxX) - minX
        let minY = Int(bubbleView.frame.minY) + bubbleSize/2
        let maxY = Int(bubbleView.frame.maxY) - minY
        let addbubblesNum = Int.random(in: 0...maxBubble - bubbleView.subviews.count)

        var counter = 0
        while counter < addbubblesNum {
            let x = Int.random(in: minX...maxX)
            let y = Int.random(in: minY...maxY)
            let bubble = Bubble(x, y, bubbleSize)
            
            if !bubbleOverlap(bubble) {
                bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
                bubbleView.addSubview(bubble)
                counter += 1
            }
        }
    }
        
    func bubbleOverlap(_ sender: Bubble) -> Bool{
        for bubble in bubbleView.subviews {
            if bubble.frame.intersects(sender.frame) {
                return true
            }
        }
        return false
    }
    
    @IBAction func bubblePressed(_ sender: Bubble) {
        sender.removeFromSuperview()
        
        if sender.backgroundColor == lastPressedColor {
            currentScore += toNearestInteger(Double(sender.score)*1.5)
        } else {
            currentScore += sender.score
        }
        lastPressedColor = sender.backgroundColor
        scoreLabel.text = String(currentScore)
        
        if currentScore > highScore {
            highScoreLabel.text = String(currentScore)
        }
    }

}

