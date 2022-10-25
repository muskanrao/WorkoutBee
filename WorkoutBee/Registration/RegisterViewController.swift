//
//  RegisterViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 10/09/22.
//

import UIKit
//import RealmSwift
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        RegisterButton.layer.cornerRadius = 30
        passwordText.layer.cornerRadius = 30
        emailText.layer.cornerRadius = 30
        
        
    }

    @IBAction func RegisterPressed(_ sender: UIButton) {
        if let email = emailText.text ,  let password = passwordText.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
                if error != nil{
                    var alert = UIAlertController()
                    var action = UIAlertAction()
                    alert = .init(title: "Sign Up error", message: "Error while registering the data.", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Error occured while registering the user.")
                    })
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                        
                        self.performSegue(withIdentifier: "Sign", sender: self)
                    
                }
                
            }
        }
    }
    

}
