//
//  OnboardViewController.swift
//  WorkoutBee
//
//  Created by Muskan on 08/09/22.
//

import UIKit

class OnboardViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var Button: UIButton!
    
    var slide : [OnboadingSlide] = []
    
    var currentPage = 0 {
        didSet{
            if currentPage == slide.count - 1{
                print(currentPage)
                Button.setTitle("Get Started", for: .normal)
            }else{
                print(currentPage)
                Button.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideValue()
        pageControler.numberOfPages = slide.count
        print(slide.count)
        
    }
    
    func slideValue(){
        slide = [
        
            OnboadingSlide(title: "The only best solution for body fit.", description: "The fit body needs a best envirenment for healthy and a ", image: UIImage.init(named: "ls1")!),
            OnboadingSlide(title: "Solution for a healthy routine with a week plan.", description: "The application will provide a weekly exercise routine for body boost.", image: UIImage.init(named: "ls1")!),
            OnboadingSlide(title: "Choose your own body type.", description: "The application will allow to choose body type and best workout solutions.", image: UIImage.init(named: "ls1")!)
            
        ]
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if currentPage == slide.count - 1{
            performSegue(withIdentifier: "Signup", sender: self)
            
        }else{
            currentPage += 1
            pageControler.currentPage = currentPage
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
 
    
    
   // MARK: -Data Source
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControler.currentPage = currentPage
    }

}
