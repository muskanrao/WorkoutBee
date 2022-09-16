//
//  TextQuizCollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 14/09/22.
//

import UIKit

class TextQuizCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TextQuizCollectionViewCell.self)
    @IBOutlet weak var NameText: UITextField!
    
    func setup(){
        
        print("TableViewCollectionviewCell")
    }
    
    
}
