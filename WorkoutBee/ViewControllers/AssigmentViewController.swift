//
//  AssigmentViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 19/09/22.
//

import UIKit
import FirebaseAuth
import Firebase

class AssigmentViewController: UIViewController {

    @IBOutlet weak var firstDay: UIButton!
    @IBOutlet weak var secondDay: UIButton!
    @IBOutlet weak var thirdDay: UIButton!
    @IBOutlet weak var fourthDay: UIButton!
    @IBOutlet weak var fifthDay: UIButton!
    @IBOutlet weak var sixthDay: UIButton!
    
    let vc = QuizViewController()
    var type = 0
    
    let db = Firestore.firestore()
    var answer1 = ""
    var answer2 = ""
    var answer3 = ""
    var count = 0
   
    var  model : [plan] = [
    
        .init(name: "Squats", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model2 : [plan] = [
    
        .init(name: "Squats1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model3 : [plan] = [
    
        .init(name: "Squats3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model4 : [plan] = [
    
        .init(name: "Squats4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model5 : [plan] = [
    
        .init(name: "Squats5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model6 : [plan] = [
    
        .init(name: "Squats6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups6", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    
    var  model21 : [plan] = [
    
        .init(name: "Squats", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model22 : [plan] = [
    
        .init(name: "Squats1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model23 : [plan] = [
    
        .init(name: "Squats3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model24 : [plan] = [
    
        .init(name: "Squats4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model25 : [plan] = [
    
        .init(name: "Squats5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model26 : [plan] = [
    
        .init(name: "Squats6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups6", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    
    var  model31 : [plan] = [
    
        .init(name: "Squats", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model32 : [plan] = [
    
        .init(name: "Squats1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping1", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack1", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching1", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model33 : [plan] = [
    
        .init(name: "Squats3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping3", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack3", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching3", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model34 : [plan] = [
    
        .init(name: "Squats4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping4", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack4", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching4", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model35 : [plan] = [
    
        .init(name: "Squats5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping5", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack5", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching5", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    var  model36 : [plan] = [
    
        .init(name: "Squats6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Planks6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Pushups6", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Skipping6", image: "ls1", calories: "23.2cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Jumping jack6", image: "ls1", calories: "24.7cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack"),
        .init(name: "Streching", image: "ls1", calories: "34.1cal", steps: "\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!\n\u{2022} This is a list item!", animation: "jumping-jack")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
    }
    
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if segue.identifier == "identifier"{
            let destinationVC = segue.destination as! dayWorkoutPlan
            if type == 1{
                if count == 1{
                    destinationVC.model = model
                }else if count == 2{
                    destinationVC.model = model2
                }else if count == 3{
                    destinationVC.model = model3
                }else if count == 4{
                    destinationVC.model = model4
                }else if count == 5{
                    destinationVC.model = model5
                }else{
                    destinationVC.model = model6
                }
                
            }else if ( type == 2){
                if count == 1{
                    destinationVC.model = model21
                }else if count == 2{
                    destinationVC.model = model22
                }else if count == 3{
                    destinationVC.model = model23
                }else if count == 4{
                    destinationVC.model = model24
                }else if count == 5{
                    destinationVC.model = model25
                }else{
                    destinationVC.model = model26
                }
                
            }else{
                if count == 1{
                    destinationVC.model = model31
                }else if count == 2{
                    destinationVC.model = model32
                }else if count == 3{
                    destinationVC.model = model33
                }else if count == 4{
                    destinationVC.model = model34
                }else if count == 5{
                    destinationVC.model = model35
                }else{
                    destinationVC.model = model36
                }
            }
            
            
            
        }
        
    }
    
    private func load(){
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
        
        if answer1 == "Bignner"{
            type = 1
        }else if ( answer1 == "Intermidate"){
            type = 2
        }else{
            type = 3
        }
    }
    
    /*func load(){
        answer1 = vc.exercise
        answer2 = vc.physique
        answer3 = vc.time
    }
      */
    @IBAction func dayOnePressed(_ sender: UIButton) {
        count = 1
        print("Day1 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayTwoPressed(_ sender: UIButton) {
        count = 2
        print("Day2 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayThreePressed(_ sender: UIButton) {
        count = 3
        print("Day3 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayFourPressed(_ sender: UIButton) {
        count = 4
        print("Day4 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func dayFivePressed(_ sender: UIButton) {
        count = 5
        print("Day5 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    @IBAction func daySixPressed(_ sender: UIButton) {
        count = 6
        print("Day6 routine")
        performSegue(withIdentifier: "identifier", sender: self)
    }
    
 /*
  if let snapshotDocuments = querySnapshot?.documents{
      for doc in snapshotDocuments{
          let data = doc.data()
          print(Auth.auth().currentUser?.email)
          if data["sender"] as! String  == Auth.auth().currentUser?.email {
              c += 1
              let  totalItem = (data["price"] as! NSString).doubleValue
                  count += totalItem
                  print("total amount = \(count)")
              
              
              
            
          }
  */
    
    
}
    

/*
1. Inside the asssigment get all the data
 2. Based on the data design a quiz like analysis func and then create 2 array where each array as the workout plan diffrently based the defined bady type.
 */


