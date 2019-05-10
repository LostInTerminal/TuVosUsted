//
//  Animation.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/6/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Animation {
    
    func animateDropdown(dropdown: UIStackView) {
        
        var delay = 0.0
        
        dropdown.subviews.forEach { (subview) in
            if subview.layer.animationKeys() != nil {
                print("adding")
                delay += 0.05
            }
        }
        
        if delay != 0.0 {
            delay += 0.6
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            
            if dropdown.isHidden {
                dropdown.isHidden = !dropdown.isHidden
                
                var currentRow = 0.0
                dropdown.subviews.forEach { (subview) in
                    currentRow += 1.0
                    subview.alpha = 0
                    subview.transform = CGAffineTransform(rotationAngle: .pi / 4)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + (currentRow * 0.05), execute: {
                        UIView.animate(withDuration: 0.05, animations: {
                            subview.transform = CGAffineTransform(rotationAngle: 0)
                            subview.alpha = 1
                        })
                    })
                }
                
                UserDefaults.standard.set(true, forKey: "dropdownHasFinishedRetracting")
                
            } else {
                
                if !UserDefaults.standard.bool(forKey: "dropdownHasFinishedRetracting") {
                    dropdown.isHidden = true
                    self.animateDropdown(dropdown: dropdown)
                    return
                }
                
                UserDefaults.standard.set(false, forKey: "dropdownHasFinishedRetracting")
                
                var currentRow = Double(dropdown.subviews.count - 1)
                dropdown.subviews.forEach { (subview) in
                    currentRow -= 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + (currentRow * 0.05), execute: {
                        UIView.animate(withDuration: 0.05, animations: {
                            subview.transform = CGAffineTransform(rotationAngle: .pi / 4)
                            subview.alpha = 0
                        })
                    })
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + ((0.1 * Double(dropdown.subviews.count)) + 0.1)) {
                    dropdown.isHidden = !dropdown.isHidden
                    UserDefaults.standard.set(true, forKey: "dropdownHasFinishedRetracting")
                }
                
            }
            
        }
        
    }
    
}
