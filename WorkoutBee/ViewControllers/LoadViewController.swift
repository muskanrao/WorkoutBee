//
//  LoadViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 18/10/22.
//

import UIKit
import Lottie

class LoadViewController: UIViewController {
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var textLabel: UITextView!
    var workoutName = ""
    var steps = ""
    var animation = ""
    var animationView = LottieAnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load()
        
    }
    
    private func load(){
        
        workoutLabel.text = workoutName
        textLabel.text = steps
        animationView = .init(name: animation)
        animationView.frame = view.bounds
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.7
        view.addSubview(animationView)
        animationView.play()
        view.sendSubviewToBack(animationView)
        animationView.frame.size.height -= 2
        animationView.frame.size.width -= 80
        animationView.frame.origin.x += 40
        animationView.frame.origin.y -= 80
        

    }
   
}
