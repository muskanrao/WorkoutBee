//
//  LoginViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 10/09/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let email = emailText.text ,  let password =  passwordText.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error
                in
                if error != nil{
                    var alert = UIAlertController()
                    var action = UIAlertAction()
                    alert = .init(title: "LogIn Error", message: "Error while logging In.", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Error accured while logging in the user.")
                    })
                    alert.addAction(action)
                    self!.present(alert, animated: true, completion: nil)
                    
                }else{
                    self!.performSegue(withIdentifier: "Login", sender: self)
                    
                }
            
                
            }
          
        
    }
    
    


}
}
