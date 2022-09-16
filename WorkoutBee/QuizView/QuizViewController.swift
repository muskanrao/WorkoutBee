//
//  QuizViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 11/09/22.
//

import UIKit

class QuizViewController: UIViewController  ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var textCollectionView: UICollectionView!
    @IBOutlet weak var quizCollectionView: UICollectionView!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightValue: UILabel!
  
    var quiz : [QuizModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightValue.text = "0"
        weightValue.text = "0"
        quiz = [QuizModel(question: "Tell us about your excercise strength", option1: "Beginner", option2: "Intermidate", option3: "Advanced"),
                QuizModel(question: "What type of physique you want ?" , option1: "Weight loss", option2: "Muscle gain + Fat loss", option3: "Weight Gain"),
                QuizModel(question: "Which is your preferable time for workout ?", option1: "Morning", option2: "Afternoon", option3: "Evening")
        ]
        registerCells()
    }
    
    private func registerCells(){
        
        quizCollectionView.register(UINib(nibName: QuizCollectionViewCell.identifier1, bundle: nil), forCellWithReuseIdentifier: QuizCollectionViewCell.identifier1)
        
    }
    
    
    @IBAction func heightSliderSelected(_ sender: UISlider) {
        
        var height = sender.value
        var heightString = String(format: "%.1f", height)
        heightValue.text = String("\(heightString) cms")
       
    }
    
    @IBAction func weightSliderSelected(_ sender: UISlider) {
        var weight = sender.value
        var weightString = String(format: "%.1f", weight)
        weightValue.text = String("\(weightString) kgs")
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
            cell.setup(quiz[indexPath.row])
            cell.layer.cornerRadius = 10.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        case textCollectionView:
            let cell = textCollectionView.dequeueReusableCell(withReuseIdentifier: TextQuizCollectionViewCell.identifier, for: indexPath) as! TextQuizCollectionViewCell
            cell.setup()
            cell.layer.cornerRadius = 10.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.black.cgColor
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

}
