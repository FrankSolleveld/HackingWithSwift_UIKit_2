//
//  ViewController.swift
//  Project2
//
//  Created by Frank Solleveld on 11/12/2020.
//

/*
 CHALLENGE TIME

 1. Keep track of how many questions have been asked, and show one final alert after they've answered 10.
 2. When someone chooses the wrong flag, tell them their mistake in your alert message.
 
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK: -- IBOutlets
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // MARK: -- Custom Variables
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    // MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if(countries.count == 0) {
            fillTheCountriesArray()
        }
        setButtonStyles()
        askQuestion(action: nil)
    }
    
    // MARK: -- Custom Methods
    func fillTheCountriesArray(){
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func setButtonStyles() {
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()) (Current score: \(score))"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
}
