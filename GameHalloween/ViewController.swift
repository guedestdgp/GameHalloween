//
//  ViewController.swift
//  GameHalloween
//
//  Created by MacStudent on 2019-10-31.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbLives: UILabel!
    var seconds = 5
    var timer: Timer?
    var isTimerRunning = false
    var stuff = [(String, String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuff = [("Dog", "🐶"), ("Cat", "🐱"), ("Mice", "🐭"), ("Fox", "🦊"), ("Rooster", "🐔"), ("Panda", "🐼"), ("Pumpkin", "🎃"), ("Ghost", "👻"), ("Dice", "🎲"), ("Game", "🎳")]
        lbLives.text = "Lives: 10"
    }


}

