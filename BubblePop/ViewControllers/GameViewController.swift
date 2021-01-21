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
    @IBOutlet weak var BubblesView: UIView!
    
    var player: String?
    var timer: Timer?
    var timeLeft = 0
    var score = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        player = defaults.string(forKey: "newPlayer")
        print("GamePlayViewController:", player!)
        
        let highScore = defaults.integer(forKey: "highScore")
        highScoreLabel.text = String(highScore)
        
        let settings = Settings()
        timeLeft = settings.gameTime
        timeLabel.text = String(timeLeft)
        scoreLabel.text = String(score)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.updateTimeLabel()
            self.updateBubbles()
        })
        timer?.fire()
    }
    
    func updateTimeLabel() {
        if timeLeft > 0 {
            timeLeft -= 1
            timeLabel.text = String(timeLeft)
        } else {
            timer?.invalidate()
            self.performSegue(withIdentifier: "scoreboardSegue", sender: nil)
        }
    }
    
    func updateBubbles() {
        
    }
    
}
