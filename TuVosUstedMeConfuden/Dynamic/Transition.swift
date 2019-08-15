//
//  Transition.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

// Instead of having the variables on each class instance, i may want to use userDefaults, but I'd still have to update it...

import UIKit

class Transition {
    
    static func manage(currentVC: ViewController, nextVC: ViewController, xTranslation: CGFloat) {
        
        UserDefaults.standard.set(true, forKey: "transitionOccuring")
        
        for case let dropdown as UIStackView in currentVC.view.subviews {
            if !dropdown.isHidden {
                dropdown.isHidden = true
            }
        }
        
        translateElements(currentVC: currentVC, xTranslation: xTranslation)
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            
            Transition.changeActiveButton(oldInactiveButton: currentVC.uiElements.englishButton, oldActiveButton: currentVC.uiElements.spanishButton, newActiveButton: nextVC.uiElements.spanishButton, newInactiveButton: nextVC.uiElements.englishButton)
            
        } else if UserDefaults.standard.string(forKey: "language") == "Español" {
            
            Transition.changeActiveButton(oldInactiveButton: currentVC.uiElements.spanishButton, oldActiveButton: currentVC.uiElements.englishButton, newActiveButton: nextVC.uiElements.englishButton, newInactiveButton: nextVC.uiElements.spanishButton)
            
        }
        
        Determine.ifFormOfYouShouldBeCalculated(vc: nextVC)
        
        setNewVariables(currentVC: currentVC, nextVC: nextVC)
        
    }
    
    static func changeActiveButton(oldInactiveButton: UIButton, oldActiveButton: UIButton, newActiveButton: UIButton, newInactiveButton: UIButton) {
        
        DispatchQueue.main.async {
            oldInactiveButton.setTitleColor(UIColor.white, for: .normal)
            oldActiveButton.setTitleColor(UIColor.black, for: .normal)
            
            newActiveButton.setTitleColor(UIColor.white, for: .normal)
            newInactiveButton.setTitleColor(UIColor.black, for: .normal)
        }
        
    }
    
    static func setNewVariables(currentVC: ViewController, nextVC: ViewController) {
        
        if currentVC.country != nil {
            nextVC.country = Translate.country(language: UserDefaults.standard.string(forKey: "language")!, word: currentVC.country)
        }
        if currentVC.person != nil {
            nextVC.person = Translate.person(language: UserDefaults.standard.string(forKey: "language")!, word: currentVC.person)
        }
        if currentVC.tertiaryDatum != nil {
            nextVC.tertiaryDatum = Translate.tertiary(language: UserDefaults.standard.string(forKey: "language")!, country: currentVC.country, word: currentVC.tertiaryDatum!)
        }
        
    }
    
    static func setNewLabelText(currentVC: ViewController, nextVC: ViewController) {
        
        if nextVC.country == nil {
            let translatedQuestion = Translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.uiElements.countriesTextButton.titleLabel!.text!)
            nextVC.uiElements.countriesTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.uiElements.countriesTextButton.setTitle(nextVC.country, for: .normal)
        }
        
        if nextVC.person == nil {
            let translatedQuestion = Translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.uiElements.peopleTextButton.titleLabel!.text!)
            nextVC.uiElements.peopleTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.uiElements.peopleTextButton.setTitle(nextVC.person, for: .normal)
        }
        
        if nextVC.uiElements.tertiaryTextButton != nil {
            if nextVC.tertiaryDatum == nil {
                let translatedQuestion = Translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.uiElements.tertiaryTextButton!.titleLabel!.text!)
                nextVC.uiElements.tertiaryTextButton!.setTitle(translatedQuestion, for: .normal)
            } else {
                nextVC.uiElements.tertiaryTextButton!.setTitle(nextVC.tertiaryDatum, for: .normal)
            }
        }
        
        if currentVC.uiElements.formOfYouLabel.isHidden == false {
            nextVC.uiElements.formOfYouLabel.isHidden = false
            nextVC.uiElements.formOfYouLabel.text = currentVC.uiElements.formOfYouLabel.text
            nextVC.view.setNeedsLayout()
        }
        
    }
    
    static func setNewDropdownOptions(currentVC: ViewController, nextVC: ViewController) {
        
        // I might be able to turn this into a generic and call it a few times, not sure if thats better or not
        
        var buttonCountry = 0
        
        for horizontalView in nextVC.uiElements.countriesDropdown.subviews {
            for case let button as UIButton in horizontalView.subviews {
                let translatedCountry = Translate.country(language: UserDefaults.standard.string(forKey: "language")!, word: button.titleLabel!.text!)
                button.setTitle(translatedCountry, for: .normal)
                buttonCountry += 1
            }
        }
        
        for case let button as UIButton in nextVC.uiElements.peopleDropdown.subviews {
            let translatedPerson = Translate.person(language: UserDefaults.standard.string(forKey: "language")!, word: button.titleLabel!.text!)
            button.setTitle(translatedPerson, for: .normal)
        }
        
        if nextVC.uiElements.tertiaryDropdown != nil {
            for case let button as UIButton in nextVC.uiElements.tertiaryDropdown!.subviews {
                let translatedTertiary = Translate.tertiary(language: UserDefaults.standard.string(forKey: "language")!, country: currentVC.country, word: button.titleLabel!.text!)
                button.setTitle(translatedTertiary, for: .normal)
            }
        }
        
    }
    
    static func translateElements(currentVC: ViewController, xTranslation: CGFloat) {
        
        var tertiaryTextButtonCenterXAnchor: NSLayoutConstraint?
        
        print("translateElements")
        
        let countriesTextButtonCenterXAnchor = getCenterXAnchor(textButton: currentVC.uiElements.countriesTextButton)
        countriesTextButtonCenterXAnchor.constant += xTranslation
        
        let peopleTextButtonCenterXAnchor = getCenterXAnchor(textButton: currentVC.uiElements.peopleTextButton)
        peopleTextButtonCenterXAnchor.constant += xTranslation
        
        if currentVC.uiElements.tertiaryTextButton != nil {
            tertiaryTextButtonCenterXAnchor = getCenterXAnchor(textButton: currentVC.uiElements.tertiaryTextButton!)
            tertiaryTextButtonCenterXAnchor!.constant += xTranslation
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            currentVC.view.layoutIfNeeded()
        })
        
    }
    
    static func animateIn(nextVC: ViewController, xTranslation: CGFloat) {
        
        var tertiaryTextButtonCenterXAnchor: NSLayoutConstraint?
        
        print("animateIn")
        
        let countriesTextButtonCenterXAnchor = getCenterXAnchor(textButton: nextVC.uiElements.countriesTextButton)
        countriesTextButtonCenterXAnchor.constant += xTranslation
        
        let peopleTextButtonCenterXAnchor = getCenterXAnchor(textButton: nextVC.uiElements.peopleTextButton)
        peopleTextButtonCenterXAnchor.constant += xTranslation
        
        if nextVC.uiElements.tertiaryTextButton != nil && UserDefaults.standard.string(forKey: "language") == "Español" {
            tertiaryTextButtonCenterXAnchor = getCenterXAnchor(textButton: nextVC.uiElements.tertiaryTextButton!)
            tertiaryTextButtonCenterXAnchor!.constant += xTranslation
        }
        
        nextVC.view.layoutIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            countriesTextButtonCenterXAnchor.constant -= xTranslation
            peopleTextButtonCenterXAnchor.constant -= xTranslation
            
            if nextVC.uiElements.tertiaryTextButton != nil && UserDefaults.standard.string(forKey: "language") == "Español" {
                tertiaryTextButtonCenterXAnchor!.constant -= xTranslation
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                nextVC.view.layoutIfNeeded()
            })
        }
        
    }
    
    static func getCenterXAnchor(textButton: UIButton) -> NSLayoutConstraint {
        
        for constraint in textButton.constraintsAffectingLayout(for: .horizontal) {
            if constraint.constant == 0 {
                return constraint
            }
        }
        
        print("WHOA")
        print(textButton)
        print(textButton.constraints)
        print(textButton.constraintsAffectingLayout(for: .horizontal))
        print(textButton.constraintsAffectingLayout(for: .horizontal).first!)
        return textButton.constraintsAffectingLayout(for: .horizontal).first!
        
    }
    
    static func changeVariablesForRotation() {
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let currentVC = appDelegate.vc
            
            UserDefaults.standard.set(true, forKey: "baseElementsNeeded")
            let nextVC = ViewController()
            currentVC.present(nextVC, animated: false, completion: {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
                    if currentVC.country != nil {
                        nextVC.country = currentVC.country
                        nextVC.uiElements.countriesTextButton.titleLabel?.text = nextVC.country
                    }
                    if currentVC.person != nil {
                        nextVC.person = currentVC.person
                        nextVC.uiElements.peopleTextButton.titleLabel?.text = nextVC.person
                    }
                    if currentVC.tertiaryDatum != nil {
                        Determine.ifTertiaryElementsAreNeeded(vc: nextVC, country: nextVC.country)
                        nextVC.tertiaryDatum = currentVC.tertiaryDatum
                        // might be a problem here?
                        nextVC.uiElements.tertiaryTextButton?.titleLabel?.text = nextVC.tertiaryDatum
                    }
                    if currentVC.uiElements.formOfYouLabel.isHidden == false {
                        nextVC.uiElements.formOfYouLabel.isHidden = false
                        nextVC.uiElements.formOfYouLabel.text = currentVC.uiElements.formOfYouLabel.text
                    }
                })
                UserDefaults.standard.set(false, forKey: "baseElementsNeeded")
                
                appDelegate.vc = nextVC
            })
        }
        
    }
    
}
