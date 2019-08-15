//
//  LanguageSelected.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 6/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

@objcMembers class LanguageSelected {
    
    static func english(sender: UIButton) {
        
        if UserDefaults.standard.string(forKey: "language") == "Español" {
            
            UserDefaults.standard.set("English", forKey: "language")
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let currentVC = appDelegate.vc
            let nextVC = currentVC.presentingViewController as! ViewController
            
            Transition.manage(currentVC: currentVC, nextVC: nextVC, xTranslation: -Style.Ratios.twoTimesScreenWidth)
            
            DispatchQueue.main.async {
                
                // the following block happens before calculateFormOfYOU
                if currentVC.uiElements.tertiaryTextButton == nil && nextVC.uiElements.tertiaryTextButton != nil {
                    nextVC.uiElements.tertiaryTextButton = nil
                    nextVC.uiElements.tertiaryDropdown = nil
                } else {
                    Create.updateUIIfNeeded(vc: nextVC)
                }
                
                Animate.labelsVertically(vc: nextVC, country: nextVC.country ?? "")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    currentVC.dismiss(animated: false, completion: {
                        Transition.translateElements(currentVC: nextVC, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                        Transition.setNewLabelText(currentVC: currentVC, nextVC: nextVC)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.vc = nextVC
                    })
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    for case let questionButton as QuestionButton in nextVC.view.subviews {
                        Obtain.newHeightConstraintFor(textButton: questionButton)
                    }
                    UserDefaults.standard.set(false, forKey: "transitionOccuring")
                })
            }
            
        }
        
    }
    
    static func spanish(sender: UIButton) {
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let currentVC = appDelegate.vc
            let nextVC = ViewController()
            let anchorValues = Style.AnchorValues()
            
            UserDefaults.standard.set("Español", forKey: "language")
            
            Transition.manage(currentVC: currentVC, nextVC: nextVC, xTranslation: Style.Ratios.twoTimesScreenWidth)
            
            // following happened before translateElements
            Transition.setNewDropdownOptions(currentVC: currentVC, nextVC: nextVC)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                currentVC.present(nextVC, animated: false, completion: {
                    if currentVC.uiElements.tertiaryTextButton != nil && nextVC.uiElements.tertiaryTextButton == nil {
                        Determine.ifTertiaryElementsAreNeeded(vc: nextVC, country: nextVC.country)
                        if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") && UserDefaults.standard.bool(forKey: "transitionOccuring") && currentVC.data.tertiary.specialOptions.contains(currentVC.country) {
                            for constraint in nextVC.uiElements.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
                                if floor(constraint.constant) == floor(anchorValues.bottomTextButtonCenterYPadding) {
                                    constraint.constant -= anchorValues.verticalTranslation
                                }
                            }
                        }
                    }
                    Transition.animateIn(nextVC: nextVC, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                    Transition.setNewLabelText(currentVC: currentVC, nextVC: nextVC)
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.vc = nextVC
                })
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                if UserDefaults.standard.bool(forKey: "transitionOccuring") {
                    for case let questionButton as QuestionButton in nextVC.view.subviews {
                        Obtain.newHeightConstraintFor(textButton: questionButton)
                    }
                }
                UserDefaults.standard.set(false, forKey: "transitionOccuring")
            }
            
        }
        
    }
    
}
