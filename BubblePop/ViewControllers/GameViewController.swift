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
    
    let bubbleRadius = 30
    let bubbleUpdateRate = 0.6
    
    var player: String?
    var timer = Timer()
    var timeLeft = 0
    var score = 0
    var maxBubble = 0
    
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
        print("GamePlayViewController:", player!)

        let highScore = defaults.integer(forKey: "highScore")
        highScoreLabel.text = String(highScore)

        let settings = Settings()
        timeLeft = settings.gameTime
        timeLabel.text = String(timeLeft)
        scoreLabel.text = String(score)
        maxBubble = settings.maxBubble
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.counter()
            self.removeBubbles()
            self.addBubbles()
            //self.removeBubble()
        }
        
    }
    
    func counter() {
        timeLeft -= 1
        timeLabel.text = String(timeLeft)
        
        if timeLeft == 0 {
            timer.invalidate()
            print("Game is over!")
        }
    }
    
    
    func removeBubbles() {
        for bubble in bubblesView.subviews {
            if Double.random(in: 1...100) < bubbleUpdateRate*100 {
                bubble.removeFromSuperview()
            }
        }
    }
    
    func addBubbles() {
//        let bubble = UIButton()
        
        let minX = Int(bubblesView.frame.minX) + bubbleRadius
        let maxX = Int(bubblesView.frame.maxX) - bubbleRadius
        let minY = Int(bubblesView.frame.minY) + bubbleRadius
        let maxY = Int(bubblesView.frame.maxY) - bubbleRadius
        
        let newbubblesNum = Int.random(in: 0...maxBubble - bubblesView.subviews.count)
        for _ in 0...newbubblesNum {
            let x = Int.random(in: minX...maxX)
            let y = Int.random(in: minY...maxY)
            let bubble = Bubble(x, y, bubbleRadius)
            

    //        bubble.frame = CGRect(x: x, y: y, width: bubbleSize, height: bubbleSize)
    //        bubble.layer.cornerRadius = 0.5 * bubble.bounds.size.width
    //        bubble.backgroundColor = .red
            
            bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
            
            self.bubblesView.addSubview(bubble)
            
        }
    }
    
    @IBAction func bubblePressed(_ sender: Bubble) {
        sender.removeFromSuperview()
        // update the player's score
        score += sender.score
        scoreLabel.text = String(score)
        print("This bubble is pressed")
    }
    
//    @IBAction func goToHighScore(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(identifier: "GreenViewController") as! GreenViewController
//        present(vc, animated: true, completion: nil)
//    }
    
}
