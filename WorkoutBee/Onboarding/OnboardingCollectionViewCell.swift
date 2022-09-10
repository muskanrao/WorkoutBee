//
//  OnboardingCollectionViewCell.swift
//  WorkoutBee
//
//  Created by Muskan on 07/09/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var slideTitleText: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
   
    
    func setup(_ slide: OnboadingSlide){
        
        slideImage.image = slide.image
        slideTitleText.text = slide.title
        slideDescription.text = slide.description
    }
    
    
}
