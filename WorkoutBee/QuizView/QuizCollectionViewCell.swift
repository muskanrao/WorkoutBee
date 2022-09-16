//
//  QuizCollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 11/09/22.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    static let identifier1 = String(describing: QuizCollectionViewCell.self)

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButotn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setup(_ stack : QuizModel ){
        
        let optionClosure = {(action: UIAction) in
            print(action.title)
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
   
    @IBAction func buttonClicked(_ sender: UIButton) {
    }
    
}
