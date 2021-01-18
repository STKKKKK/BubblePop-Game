//
//  ViewController.swift
//  BubblePop
//
//  Created by skk on 2021/1/16.
//  Copyright © 2021 Hong Kung. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextFieid: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "Bubble Pop Pro"
    }

    @IBAction func onClick(_ sender: Any) {
        print("Start Game")
        
        if let name = nameTextFieid.text {
            if name.count > 0 {
                print("Trigger Segue for", name)
                
//                let defaults = UserDefaults.standard
//                defaults.set(name, forKey: "PlayerName")
                
                self.performSegue(withIdentifier: "startGameSegue", sender: nil)
            } else {
                print("Please enter a non-empty name")
            }
        } else {
            print("Please enter a name")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "startGameSegue":
                print("Prepare Segue for", identifier);

                if let gamePlayViewController = segue.destination as? GamePlayViewController {
                    if let name = nameTextFieid.text {
                        gamePlayViewController.name = name;
                    } else {
                        print("Name is empty")
                    }
                } else {
                    print("Type Cast Failed for Segue", identifier)
                }

            break;
            default:
                print("Prepare Segue for unhandle identifier", identifier)
            }
        } else {
            print("Segue with empty identifier is petformed. Better check it.")
        }
    }
    
}


