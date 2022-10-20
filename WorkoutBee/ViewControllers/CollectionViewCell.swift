//
//  CollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 18/10/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CollectionViewCell.self)
    static var workout = ""
    static var steps = ""

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var calories: UILabel!
    var workoutName = ""
    var process = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(_ values: plan){
        
   
        
        CollectionViewCell.workout = workoutName
        CollectionViewCell.steps = process
        name.text = values.name
        image.image = .init(named: values.image)
        calories.text = values.calories
    }

}
