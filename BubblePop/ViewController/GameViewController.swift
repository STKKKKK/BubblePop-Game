//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/20.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var bubblesView: UIView!
    
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
        
        let dataStorage = DataStorage()
        player = dataStorage.newPlayer
        print("Game Start for: \(player!)")
        
        // highScore = dataStorage.highScore
//        if dataStorage.records.count == 0 {
//            highScoreLabel.text = "--"
//        } else {
//            highScoreLabel.text = String(dataStorage.records[0].score)
//        }
//        highScore = dataStorage.getHigestScore()
        highScore = dataStorage.getHighRankScore("gold")
        highScoreLabel.text = String(highScore)
        
        timeLeft = dataStorage.gameTime
        timeLabel.text = String(timeLeft)
        scoreLabel.text = String(currentScore)
        maxBubble = dataStorage.maxBubble
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.updateTime()
            self.removeBubbles()
            self.addBubbles()
        }
        
    }
    
    func updateTime() {
        timeLeft -= 1
        timeLabel.text = String(timeLeft)
        
        if timeLeft == 0 {
            timer.invalidate()
            //self.removeAllBubbles()
            print("Game over!")
            
            let dataStorage = DataStorage()
            dataStorage.setNewRecord(currentScore)
            
            let dataStorage2 = DataStorage()
            print(dataStorage2.gold)
            print(dataStorage2.getHighRankScore("gold"))
            print(dataStorage2.silver)
            print(dataStorage2.getHighRankScore("silver"))
            print(dataStorage2.bronze)
            print(dataStorage2.getHighRankScore("bronze"))

            

//            self.performSegue(withIdentifier: "scoreboardSegue", sender: nil)
        }
    }
    
    func removeAllBubbles() {
        for bubble in bubblesView.subviews {
            bubble.removeFromSuperview()
        }
    }
    
    func removeBubbles() {
        for bubble in bubblesView.subviews {
            if Double.random(in: 0...100) < bubbleUpdateRate*100 {
                bubble.removeFromSuperview()
            }
        }
    }
    
    
    func addBubbles() {
        let minX = Int(bubblesView.frame.minX) + bubbleSize
        let maxX = Int(bubblesView.frame.maxX) - minX
        let minY = Int(bubblesView.frame.minY) + bubbleSize
        let maxY = Int(bubblesView.frame.maxY) - minY
        let addbubblesNum = Int.random(in: 0...maxBubble - bubblesView.subviews.count)

        var counter = 0
        while counter < addbubblesNum {
            let x = Int.random(in: minX...maxX)
            let y = Int.random(in: minY...maxY)
            let bubble = Bubble(x, y, bubbleSize)

            if !bubbleOverlap(bubble) {
                bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
                bubblesView.addSubview(bubble)
                counter += 1
            }
        }
    }
    
    func bubbleOverlap(_ sender: Bubble) -> Bool{
        for bubble in bubblesView.subviews {
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
    }
    
}
