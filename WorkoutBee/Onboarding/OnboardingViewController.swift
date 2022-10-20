//
//  ViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 06/09/22.
//

import UIKit
//import Lottie

class OnboardingViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
   
    

   // var animationView : AnimationView?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var Button: UIButton!
    
    var slide : [OnboadingSlide] = [
        .init(title: "The only best solution for body fit.", description: "The fit body needs a best envirenment for healthy and a ", image: UIImage.init(named: "ls1")!),
        .init(title: "Solution for a healthy routine with a week plan.", description: "The application will provide a weekly exercise routine for body boost.", image: UIImage.init(named: "ls1")!),
        .init(title: "Choose your own body type.", description: "The application will allow to choose body type and best workout solutions.", image: UIImage.init(named: "ls1")!)
    ]
    
    var currentPage = 0 {
        didSet{
            if currentPage == slide.count - 1{
                Button.titleLabel?.text =  "Let's Start"
            }else{
                Button.titleLabel?.text = "Next"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControler.numberOfPages = slide.count ?? 0
        
     
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControler.currentPage = currentPage
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if currentPage  == slide.count - 1{
            print("Go to next page -> signup page")
            performSegue(withIdentifier: "Signup", sender: self)

            
        }else{
            
            currentPage += 1
            pageControler.currentPage = currentPage
            let indexPath = IndexPath(item : currentPage , section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    
        
    }
    
    
    
}


/*
 animationView = .init(name: "scan-menu")
 animationView?.frame = CGRect(x: -150, y: 50, width: 800, height: 600)
 animationView?.loopMode = .loop
 animationView?.animationSpeed = 0.5
 view.addSubview(animationView!)
 animationView?.play()
 
 view.sendSubviewToBack(animationView!)
 if currentPage == slides.count - 1{
     //view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
     print("Go to next page")
     self.performSegue(withIdentifier: "signUp", sender: self)
    // let controller = storyboard?.instantiateViewController(withIdentifier: "signUp") as! SignUpViewController
     
     //controller.modalPresentationStyle = .fullScreen
    // controller.modalTransitionStyle = .flipHorizontal
    // present(controller, animated: true, completion: nil)
 }else{
     if currentPage+1 == slides.count - 1{
        view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
         
        collectionView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
      
         currentPage += 1
         pageControl.currentPage = currentPage
         let indexPath = IndexPath(item: currentPage, section: 0)
         collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
     }else{
         currentPage += 1
        // collectionView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        // view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
         //collectionView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
         pageControl.currentPage = currentPage
         let indexPath = IndexPath(item: currentPage, section: 0)
         collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
     }
 }
 
 */
