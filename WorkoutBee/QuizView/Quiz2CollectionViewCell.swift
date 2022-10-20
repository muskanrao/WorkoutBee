//
//  Quiz2CollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 16/09/22.
//

import UIKit

class Quiz2CollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: Quiz2CollectionViewCell.self)

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var VIEW: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(){
        
        print("TableViewCollectionviewCell")
    }
    
    @IBAction func textField(_ sender: UITextField) {
        
        VIEW.backgroundColor = .black
        
    }
    
    

}
