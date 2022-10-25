//
//  QuizViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 11/09/22.
//

import UIKit
import Firebase

class QuizViewController: UIViewController  ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var textCollectionView: UICollectionView!
    @IBOutlet weak var quizCollectionView: UICollectionView!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    var firstAns = ""
    var secondAns = ""
    var thirdAns = ""
    var hSliderValue = ""
    var wSliderValue = ""
    let db = Firestore.firestore()
    let exercise = QuizCollectionViewCell.buttonOutput1
    let physique = QuizCollectionViewCell.buttonOutput2
    let time = QuizCollectionViewCell.buttonOutput3
  
    var quiz : [QuizModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(exercise)
        heightValue.text = "0"
        weightValue.text = "0"
        quiz = [QuizModel(question: "Tell us about your excercise strength ?", option1: "Beginner", option2: "Intermidate", option3: "Advanced"),
                QuizModel(question: "What type of physique you want ?" , option1: "Weight loss", option2: "Muscle gain + Fat loss", option3: "Weight Gain"),
                QuizModel(question: "Which is your preferable time for workout ?", option1: "Morning", option2: "Afternoon", option3: "Evening")
        ]
        registerCells()
        print("--------------")
        print(firstAns)
        print(secondAns)
        print(thirdAns)
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth = 0.2
        registerButton.layer.shadowColor = UIColor.white.cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        registerButton.layer.shadowRadius = 5.0
        registerButton.layer.shadowOpacity = 1
        registerButton.layer.masksToBounds = false
        
    }
    
    
    
    private func registerCells(){
        
        quizCollectionView.register(UINib(nibName: QuizCollectionViewCell.identifier1, bundle: nil), forCellWithReuseIdentifier: QuizCollectionViewCell.identifier1)
        textCollectionView.register(UINib(nibName: Quiz2CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: Quiz2CollectionViewCell.identifier)
        
    }
    
    
    @IBAction func heightSliderSelected(_ sender: UISlider) {
        
        var height = sender.value
        var heightString = String(format: "%.1f", height)
        
        heightValue.text = String("\(heightString) cms")
        hSliderValue = heightString
       
    }
    
    @IBAction func weightSliderSelected(_ sender: UISlider) {
        var weight = sender.value
        var weightString = String(format: "%.1f", weight)
        weightValue.text = String("\(weightString) kgs")
        wSliderValue = weightString
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case quizCollectionView:
            return quiz.count
       case textCollectionView:
            return 1
        default:
            return 0
        }
            
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case quizCollectionView:
            let cell = quizCollectionView.dequeueReusableCell(withReuseIdentifier: QuizCollectionViewCell.identifier1, for: indexPath) as! QuizCollectionViewCell
            cell.backgroundColor = UIColor.init(red: 177, green: 178, blue: 255, alpha: 1)
            cell.setup(quiz[indexPath.row])
            if indexPath.row == 0{
                firstAns = cell.optionButotn.currentTitle!
            }else if indexPath.row == 1{
                secondAns = cell.optionButotn.currentTitle!
           
            }else{
                thirdAns = cell.optionButotn.currentTitle!
            }

            cell.layer.cornerRadius = 15.0
            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 0.2
            cell.layer.shadowColor = UIColor.white.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        case textCollectionView:
            let cell = textCollectionView.dequeueReusableCell(withReuseIdentifier: Quiz2CollectionViewCell.identifier, for: indexPath) as! Quiz2CollectionViewCell
            cell.setup()
           // cell.layer.cornerRadius = 15
            cell.layer.cornerRadius = 15.0
            cell.layer.borderWidth = 0.2
            cell.layer.shadowColor = UIColor.white.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        default:
            return UICollectionViewCell()
        }
       
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
       
        
    }
    /*
     func analysisData(){
         switch exercise {
         case "Beginner":
            //exercise type 1.
         case "Intermidate":
             //exercise type2.
         default:
             //exercise type3.
         }
    }*/

    @IBAction func registerPressed(_ sender: UIButton) {
        
  
        let hValue = hSliderValue
        let wValue = wSliderValue
        
        let storedData = Auth.auth().currentUser?.email
        db.collection("user").addDocument(data: ["height": hSliderValue,"weight": wSliderValue, "selectedOption1": exercise, "selectedOption2": physique, "selectedOption3": time]) { (error) in
            if let e = error{
                print("There  is issue while saving data to firestore FOR POPULAR AND SPECIAL VIEW.\(e)")
            }else{
                print("Succesfully saved")
            }
        }
        
        
        self.performSegue(withIdentifier: "registPressed", sender: self)
        
    }
    /*
     QuizModel(question: "Tell us about your excercise strength", option1: "Beginner", option2: "Intermidate", option3: "Advanced"),
             QuizModel(question: "What type of physique you want ?" , option1: "Weight loss", option2: "Muscle gain + Fat loss", option3: "Weight Gain"),
             QuizModel(question: "Which is your preferable time for workout ?", option1: "Morning", option2: "Afternoon", option3: "Evening")
     ]
     */
    
}
