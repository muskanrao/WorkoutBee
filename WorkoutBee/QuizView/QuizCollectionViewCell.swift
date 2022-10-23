//
//  QuizCollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 11/09/22.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    static let identifier1 = String(describing: QuizCollectionViewCell.self)
    static var question1 = ""
    static var question2 = ""
    static var question3 = ""
    static var buttonOutput1 = ""
    static var buttonOutput2 = ""
    static var buttonOutput3 = ""

    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButotn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func setup(_ stack : QuizModel ){
        
        
        
        let optionClosure = {(action: UIAction) in
            if  "Tell us about your excercise strength ?" == stack.question{
                QuizCollectionViewCell.buttonOutput1 = action.title
                print(QuizCollectionViewCell.buttonOutput1)
            }
            else if "What type of physique you want ?" == stack.question {
                QuizCollectionViewCell.buttonOutput2 = action.title
                print(QuizCollectionViewCell.buttonOutput2)
            }
            else if "Which is your preferable time for workout ?" == stack.question{
                QuizCollectionViewCell.buttonOutput3 = action.title
                print(QuizCollectionViewCell.buttonOutput3)
            }
            
        }
        
        optionButotn.menu = UIMenu(children : [
            UIAction(title: stack.option1, state: .on, handler: optionClosure),
            UIAction(title: stack.option2,  handler: optionClosure),
            UIAction(title: stack.option3,  handler: optionClosure)
        ])
        optionButotn.showsMenuAsPrimaryAction = true
        optionButotn.changesSelectionAsPrimaryAction = true
        questionLabel.text = stack.question
        
    }
    
   
    
    @IBAction func popupButtonPressed(_ sender: UIButton) {
       

    }
}
