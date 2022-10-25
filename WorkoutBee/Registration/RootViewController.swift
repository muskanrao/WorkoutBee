//
//  RootViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 08/09/22.
//

import UIKit

class RootViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    var text = "WORKOUT BEE"
    var text2 = "Strength does not come from physical capacity. It comes from an indomitable will.."
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 30
        signupButton.layer.cornerRadius = 30
        label.textColor = .white
       
        loginButton.layer.borderWidth = 0.0
        loginButton.layer.shadowColor = UIColor.white.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginButton.layer.shadowRadius = 5.0
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.masksToBounds = false
        signupButton.layer.borderWidth = 0.0
        signupButton.layer.shadowColor = UIColor.white.cgColor
        signupButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        signupButton.layer.shadowRadius = 5.0
        signupButton.layer.shadowOpacity = 1
        signupButton.layer.masksToBounds = false
        var charIndex = 0.0
        for a in text {
            Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false ) { (timer) in
                self.label.text?.append(a)
            }
            
            charIndex += 1
            
            
        }
        
        
    }
}
