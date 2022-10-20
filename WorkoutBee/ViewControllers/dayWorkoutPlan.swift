//
//  dayWorkoutPlan.swift
//  WorkoutBee
//
//  Created by Muskan on 17/10/22.
//

import Foundation
import SwiftUI

class dayWorkoutPlan : UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var model : [plan] = []
    var text  = ""
    var steps = ""
    var animationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        print(model.count)
    }
    
    private func registerCell(){
        collectionView.register(UINib(nibName: CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
  
        
        cell.setup(model[indexPath.item])
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        text =  model[indexPath.row].name
        steps = model[indexPath.row].steps
        animationName = model[indexPath.row].animation
        performSegue(withIdentifier: "load", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! LoadViewController
        destinationVC.workoutName = text
        destinationVC.steps = steps
        destinationVC.animation = animationName
        
        /*if let cell = sender as? UICollectionViewCell, let indexPath = self.collectionView.indexPath(for: cell){
                let destinationVC = segue.identifier as! LoadViewController
                destinationVC.workoutName = model[indexPath.row].name
                destinationVC.steps = model[indexPath.row].steps
                
        }*/
        
    }
    
}


