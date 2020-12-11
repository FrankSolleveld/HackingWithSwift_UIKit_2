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
    
    // MARK: -- Custom Variables
    var countries = [String]()
    var score = 0
    
    // MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(countries.count == 0) {
            fillTheCountriesArray()
        }
        
        setButtonStyles()
        
        askQuestion()
    }
    
    // MARK: -- Custom Methods
    func fillTheCountriesArray(){
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "england", "usa"]
    }
    
    func setButtonStyles() {
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(){
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    // MARK: -- Delegate Methods
}

