//
//  ViewController.swift
//  GameHalloween
//
//  Created by MacStudent on 2019-10-31.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btsChoices: [UIButton]!
    @IBOutlet weak var lbLives: UILabel!
    @IBOutlet weak var btStart: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var lbImages: UILabel!
    var seconds = 5
    var timer: Timer?
    var isTimerRunning = false
    var stuff = [(String, String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuff = [("Dog", "🐶"), ("Cat", "🐱"), ("Mice", "🐭"), ("Fox", "🦊"), ("Rooster", "🐔"), ("Panda", "🐼"), ("Pumpkin", "🎃"), ("Ghost", "👻"), ("Dice", "🎲"), ("Game", "🎳")]
        lbLives.text = "Lives: 10"
        lbPoint.text = "Point: 0"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        lbImages.text = stuff.randomElement()!.1
    }


    @IBAction func btsChoicesAction(_ sender: UIButton) {
    }
    
    @objc func update() {
        lbImages.text = stuff.randomElement()!.1
        //To stop: timer.invalidate()
    }
    
    func randonImages() -> String {
        return stuff.randomElement()!.1
    }
}

