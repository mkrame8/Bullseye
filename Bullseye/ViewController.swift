//
//  ViewController.swift
//  Bullseye
//
//  Created by Melanie Kramer on 1/13/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50
    // outlets to connect to slider and labels
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    // class variables to hold values
    var targetValue = 0
    var score = 0
    var round = 0
    
    // function will assign images to the slider
    // call super.viewDidLoad()
    // then start a new game
    override func viewDidLoad() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        super.viewDidLoad()
        startNewGame()
    }

    // action function for alert message
    // display points earned + a title
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        // options to assign for the title/points based on how
        // close user got the slider to target value
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        // add this round score to total points
        score += points
        
        // set the message to display this rounds points
        // and this rounds message
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        // var action to hold this action
        // when user hits "OK" button, startNewRound() called
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: { _ in
                                    self.startNewRound()
        })
        // add action to alert controller
        alert.addAction(action)
        // display alert
        present(alert, animated: true, completion: nil)
    }
    
    // action function gets the value of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    // function will add 1 to round count,
    // reset slider to 50,
    // and generate + display random number for user to target
    func startNewRound() {
        round += 1
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    // new game will reset rounds and scores to zero
    // call startNewRound()
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    // function will update labels to current
    // values of variables
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

