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
    var seconds = 60
    var timer: Timer?
    var timerCount: Timer?
    var timerButtons: Timer?
    var isTimerRunning = false
    var stuff = [(String, String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stuff = [("Dog", "🐶"), ("Cat", "🐱"), ("Mice", "🐭"), ("Fox", "🦊"), ("Rooster", "🐔"), ("Panda", "🐼"), ("Pumpkin", "🎃"), ("Ghost", "👻"), ("Dice", "🎲"), ("Game", "🎳")]
        lbLives.text = "Lives: 10"
        lbPoint.text = "Point: 0"
        buttonsChange()
    }
    
    @objc func update() {
        lbImages.text = stuff.randomElement()!.1
        //To stop: timer.invalidate()
    }
    
    @objc func buttonsChange() {
        let element1 = stuff.randomElement()!
        let newElements1 = stuff.filter { $0 != element1 }
        btsChoices[0].setTitle(element1.0, for: .normal)
        
        let element2 = newElements1.randomElement()!
        let newElements2 = newElements1.filter { $0 != element2 }
        btsChoices[1].setTitle(element2.0, for: .normal)
        
        let element3 = newElements2.randomElement()!
        let newElements3 = newElements2.filter { $0 != element3 }
        btsChoices[3].setTitle(element3.0, for: .normal)
        
        let element4 = newElements3.randomElement()!
        btsChoices[4].setTitle(element4.0, for: .normal)
        
//        switch element {
//        case btsChoices[0].titleLabel?.text:
//            element = stuff.randomElement()!.0
//        case btsChoices[1].titleLabel?.text:
//            element = stuff.randomElement()!.0
//        case btsChoices[2].titleLabel?.text:
//            btsChoices[2].titleLabel?.text = element
//        case btsChoices[3].titleLabel?.text:
//            btsChoices[3].titleLabel?.text = element
//        default:
//            btsChoices[0].setTitle(stuff.randomElement()!.0, for: .normal)
//            btsChoices[1].setTitle(stuff.randomElement()!.0, for: .normal)
//            btsChoices[2].setTitle(stuff.randomElement()!.0, for: .normal)
//            btsChoices[3].setTitle(stuff.randomElement()!.0, for: .normal)
//        }
    }
    
    @objc func countTimer() {
        let getTimer = Int(lbTimer.text!)
        if getTimer != 0 { lbTimer.text = "\(getTimer! - 1)" }
        else {
            timer?.invalidate()
            timerCount?.invalidate()
        }
    }
    
    func randonImages() -> String {
        return stuff.randomElement()!.1
    }
    
    @IBAction func btStartAction(_ sender: UIButton) {
        lbTimer.text = "\(seconds)"
        update()
        buttonsChange()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
        timerButtons = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(buttonsChange), userInfo: nil, repeats: true)
    }
}

