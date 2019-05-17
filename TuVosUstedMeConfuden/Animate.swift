//
//  Animation.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/6/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Animation {
    
    func dropdown(dropdown: UIStackView) {
        
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
                    self.dropdown(dropdown: dropdown)
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
    
    func tertiaryElements(vc: ViewController, language: String, country: String) {
        
        var constraintToUpdate: NSLayoutConstraint!
        
        for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .horizontal) {
            if constraint.constant == 0 {
                constraintToUpdate = constraint
            }
        }
        
        
        if language == "English" {
            constraintToUpdate.constant += Style.Ratios.twoTimesScreenWidth
        } else if language == "Español" {
            constraintToUpdate.constant -= Style.Ratios.twoTimesScreenWidth
        }
        vc.view.layoutIfNeeded()
        
        if language == "English" {
            constraintToUpdate.constant -= Style.Ratios.twoTimesScreenWidth
        } else if language == "Español" {
            constraintToUpdate.constant += Style.Ratios.twoTimesScreenWidth
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            vc.view.layoutIfNeeded()
        })
        
    }
    
    func textFieldsVertically(vc: ViewController, country: String) {
        
        let constraintConstant = Style.Ratios.halfOfScreenHeight - Style.AnchorValues.middleTextButtonCenterY + Style.AnchorValues.bottomTextButtonCenterY
        
        if country != "El Salvador" && country != "Guatemala" && country != "Honduras" {
            
            for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
                if constraint.constant == Style.Ratios.middleCenterYRatio || constraint.constant == 381 {
                    constraint.constant += constraintConstant
                }
            }
            
            if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {
                for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
                    if constraint.constant == Style.AnchorValues.bottomTextButtonCenterY {
                        constraint.constant -= constraintConstant
                    }
                }
            }
            
        } else if country == "El Salvador" || country == "Guatemala" || country == "Honduras" {
            
            for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
                if UserDefaults.standard.bool(forKey: "transitionOccuring") {
                    if constraint.constant == Style.Ratios.middleCenterYRatio {
                        constraint.constant -= constraintConstant
                    }
                } else {
                    if constraint.constant == Style.AnchorValues.bottomTextButtonCenterY {
                        constraint.constant -= constraintConstant
                    }
                }
            }
            
            if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {
                for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
                    if constraint.constant == Style.Ratios.middleCenterYRatio || constraint.constant == 253.75 {
                        constraint.constant += constraintConstant
                    }
                }
            }
            
            UserDefaults.standard.set(true, forKey: "additionalInfoTertiaryWasActive")
            
        } else { return }
        
        UIView.animate(withDuration: 0.5) {
            vc.view.layoutIfNeeded()
        }
        
    }
    
}
