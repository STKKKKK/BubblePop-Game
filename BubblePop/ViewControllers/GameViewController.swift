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
    
    
    var player: String?
    var timer = Timer()
    var timeLeft = 0
    var score = 0
    
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
        
        let a = Int(bubblesView.frame.minX)
        let b = Int(bubblesView.frame.maxX)
        let c = Int(bubblesView.frame.minY)
        let d = Int(bubblesView.frame.maxY)
        print(a, b, c, d)

        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.counter()
            //self.printing()
            self.generateBubble()
            //self.removeBubble()
        }
        
    }
    
    func counter() {
        timeLeft -= 1
        timeLabel.text = String(timeLeft)
        
        if timeLeft == 0 {
            timer.invalidate()
            print("Game is over!")
            
//            let vc = storyboard?.instantiateViewController(identifier: "GreenViewController") as! GreenViewController
//            present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func printing() {
        print("The timer is counting down!")
    }
    
    @objc func generateBubble() {
        // create bubble class
        let bubble = UIButton()
        
        let a = Int(bubblesView.frame.minX)
        
//        let xAxis = Int.random(in: 20...200)
//        let yAxis = Int.random(in: 20...200)
        let xAxis = Int.random(in: 20...200)
        let yAxis = Int.random(in: 20...200)

        bubble.frame = CGRect(x: xAxis, y: yAxis, width: 50, height: 50)
        bubble.layer.cornerRadius = 0.5 * bubble.bounds.size.width
        bubble.backgroundColor = .red
        bubble.addTarget(self, action: #selector(bubblePressed), for: .touchUpInside)
        
        self.bubblesView.addSubview(bubble)
        
    }
    
    @IBAction func bubblePressed(_ sender: UIButton) {
        sender.removeFromSuperview()
        // update the player's score
        print("This bubble is pressed")
    }
    
//    @IBAction func goToHighScore(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(identifier: "GreenViewController") as! GreenViewController
//        present(vc, animated: true, completion: nil)
//    }
    
}
