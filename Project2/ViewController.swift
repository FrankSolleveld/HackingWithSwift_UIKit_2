//
//  ViewController.swift
//  Project2
//
//  Created by Frank Solleveld on 11/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -- IBOutlets
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var questionsLabel: UILabel!
    
    // MARK: -- Custom Variables
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numOfQuestionsAnswered = 0
    
    // MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showScore))
        updateQuestionsLabel()
        if(countries.count == 0) {
            fillTheCountriesArray()
        }
        setButtonStyles()
        askQuestion(action: nil)
    }
    
    // MARK: -- Custom Methods
    @objc func showScore() {
        let ac = UIAlertController(title: "Your score", message: "Your current score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    func updateQuestionsLabel(){
        questionsLabel.text = "You answered \(numOfQuestionsAnswered) out of 10 questions."
    }
    
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
        guard numOfQuestionsAnswered != 10 else { return showEndOfGameAlert() }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased())"
    }
    
    func resetGame(action: UIAlertAction!) {
        score = 0
        numOfQuestionsAnswered = 0
        updateQuestionsLabel()
        askQuestion(action: nil)
    }
    
    func showCorrectAlert(alertTitle: String){
        let ac = UIAlertController(title: alertTitle, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func showWrongStatus(alertTitle: String, senderTag: Int){
        let ac = UIAlertController(title: alertTitle, message: "The flag you chose is the flag of \(countries[senderTag].uppercased()). Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func showEndOfGameAlert(){
        let ac = UIAlertController(title: "Finish!", message: "You answered all questions. Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: resetGame))
        present(ac, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var alertTitle: String
        if sender.tag == correctAnswer {
            alertTitle = "That's correct!"
            score += 1
            numOfQuestionsAnswered += 1
            updateQuestionsLabel()
            showCorrectAlert(alertTitle: alertTitle)
        } else {
            alertTitle = "Wrong"
            score -= 1
            numOfQuestionsAnswered += 1
            updateQuestionsLabel()
            showWrongStatus(alertTitle: alertTitle, senderTag: sender.tag)
        }
    }
}
