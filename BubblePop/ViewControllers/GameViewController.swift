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
    
    let defaults = UserDefaults.standard
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let defaults = UserDefaults.standard
//        player = defaults.string(forKey: "newPlayer")
//        print("GamePlayViewController:", player!)
//
//        let highScore = defaults.integer(forKey: "highScore")
//        highScoreLabel.text = String(highScore)
//
//        let settings = Settings()
//        timeLeft = settings.gameTime
//        timeLabel.text = String(timeLeft)
//        scoreLabel.text = String(score)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
//            self.updateTimeLabel()
//            self.updateBubbles()
//        })
//        timer?.fire()
//    }
//
//    func updateTimeLabel() {
//        if timeLeft > 0 {
//            timeLeft -= 1
//            timeLabel.text = String(timeLeft)
//        } else {
//            timer?.invalidate()
//            self.performSegue(withIdentifier: "scoreboardSegue", sender: nil)
//        }
//    }
//
//    func updateBubbles() {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        player = defaults.string(forKey: "newPlayer")
        // print("GamePlayViewController:", player!)
        highScore = defaults.integer(forKey: "highScore")
        highScoreLabel.text = String(highScore)

        let settings = Settings()
        timeLeft = settings.gameTime
        timeLabel.text = String(timeLeft)
        scoreLabel.text = String(currentScore)
        maxBubble = settings.maxBubble
        
//        let minX = Int(bubblesView.frame.minX) + bubbleSize
//        let maxX = Int(bubblesView.frame.maxX) - minX
//        let minY = Int(bubblesView.frame.minY) + bubbleSize
//        let maxY = Int(bubblesView.frame.maxY) - minY
//        print(minX, maxX, minY, maxY)
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.updateTime()
            self.removeBubbles()
            self.addBubbles()
            //self.removeBubble()
        }
        
    }
    
    func updateTime() {
        timeLeft -= 1
        timeLabel.text = String(timeLeft)
        
        if timeLeft == 0 {
            timer.invalidate()
            print("Game is over!")
            self.performSegue(withIdentifier: "scoreboardSegue", sender: nil)
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
//        let bubble = UIButton()
        
        let minX = Int(bubblesView.frame.minX) + bubbleSize
        let maxX = Int(bubblesView.frame.maxX) - minX
        let minY = Int(bubblesView.frame.minY) + bubbleSize
        let maxY = Int(bubblesView.frame.maxY) - minY
        
        let addbubblesNum = Int.random(in: 0...maxBubble - bubblesView.subviews.count)
//        for _ in 0...addbubblesNum {
//            let x = Int.random(in: minX...maxX)
//            let y = Int.random(in: minY...maxY)
//            let bubble = Bubble(x, y, bubbleSize)
//
//            if bubbleOverlap(bubble) {
//                continue
//            }
//
//            bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
//
//            bubblesView.addSubview(bubble)
//        }
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
    
    
//    func pop() {
//        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
//
//        self.bubblesView.addSubview(bubble)
//    }
    
    @IBAction func bubblePressed(_ sender: Bubble) {
        sender.removeFromSuperview()
        
        if sender.backgroundColor == lastPressedColor {
            // Round to the nearest integer
            let scoreGained = Double(sender.score) * 1.5
            if scoreGained - Double(Int(scoreGained)) >= 0.5 {
                currentScore += Int(scoreGained) + 1
            } else {
                currentScore += Int(scoreGained)
            }
        } else {
            currentScore += sender.score
        }
        lastPressedColor = sender.backgroundColor
        scoreLabel.text = String(currentScore)
    }
    
//    @IBAction func goToHighScore(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(identifier: "GreenViewController") as! GreenViewController
//        present(vc, animated: true, completion: nil)
//    }
    
}
