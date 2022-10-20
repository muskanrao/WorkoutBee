//
//  LoginViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 10/09/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    //let db = Firestore.firestore()
    //let querySnapshot = QuerySnapshot()
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
    
    
    /*
     db.collection("user").getDocuments { [self] (querySnapshot , error) in
         if error != nil{
             print("Error while loading saved data.")
         }else{
             if let snapshotDocuments = querySnapshot?.documents{
                 for doc in snapshotDocuments{
                     let data = doc.data()
                     print(Auth.auth().currentUser?.email)
                     if data["sender"] as! String  == Auth.auth().currentUser?.email {
                         
                         answer1 = data["selectedOption1"] as! String
                         answer2 = data["selectedOption2"] as! String
                         answer3 =  data["selectedOption3"] as! String

                     }
                     
                 }
                 performSegue(withIdentifier: "identifier", sender: self)
             }
         }
     }
     */
    
     
}
