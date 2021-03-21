//
//  ViewController.swift
//  guess the pic
//
//  Created by Sebouh Mazloumian on 19.03.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for learning purpose , you can init directly in var countries
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if count == 10 {
            score = 0
            count = 0
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        count += 1
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " - level: \(count) - score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var actionText = "Continue"
        
        if sender.tag == correctAnswer {
            title = "Correct ✅"
            score += 1
            
        } else {
            title = "Wrong ❌"
            score -= 1
        }
        
        if count == 10 {
            if score > 5 {
              title = "You Won 😃"
                actionText = "Start Again"
            } else {
                title = "You lost 😔"
                actionText = "Try Again"
            }
        }
    
        let ac = UIAlertController(title: title, message: "Your score is \(score) ", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: actionText, style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}
