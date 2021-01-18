//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/18.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startGame(_ sender: Any) {
        if let name = nameTextField.text {
            if name.count > 0 {
                print("Trigger Segue for", name)
                self.performSegue(withIdentifier: "startGameSegue", sender: name)
            } else {
                print("Please enter a non-empty name")
            }
        } else {
            print("Please enter a name")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue" {
            if let vc = segue.destination as? GameViewController {
//                let playerName = nameTextFieid.text
//                vc.name = playerName!
                vc.name = sender as? String
            }
        } else if segue.identifier == "goSettingsSegue" {
            if let _ = segue.destination as? SettingsViewController {
                print("Yattaze")
            }
        }
    }
    
    @IBAction func goSettings(_ sender: Any) {
        self.performSegue(withIdentifier: "goSettingsSegue", sender: nil)
    }
    
}

