//
//  ViewController+UIViewControllerTransitioningDelegate2.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/25/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

/*import UIKit

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print(presented)
        print(presenting)
        print("presenting")
        
        /*let currentVC = presenting as! ViewController
        let nextVC = presented as! ViewController
        
        print("moving right")
        nextVC.countriesDropdown.transform = CGAffineTransform(translationX: nextVC.view.frame.width * 2, y: 0)
        nextVC.peopleDropdown.transform = CGAffineTransform(translationX: nextVC.view.frame.width * 2, y: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.animate(withDuration: 1.0, animations: {
                print("moving back")
                nextVC.countriesDropdown.transform = CGAffineTransform(translationX: -nextVC.view.frame.width * 2, y: 0)
                nextVC.peopleDropdown.transform = CGAffineTransform(translationX: -nextVC.view.frame.width * 2, y: 0)
            })
        }*/
        
        return self as! UIViewControllerAnimatedTransitioning
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //print("will add functionality later")
        return self as! UIViewControllerAnimatedTransitioning
    }
    
}
*/
