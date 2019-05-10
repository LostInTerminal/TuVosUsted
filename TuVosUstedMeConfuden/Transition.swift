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
    
    let translate = Translate()
    
    func changeActiveButton(oldInactiveButton: UIButton, oldActiveButton: UIButton, newActiveButton: UIButton, newInactiveButton: UIButton) {
        
        oldInactiveButton.setTitleColor(UIColor.white, for: .normal)
        oldActiveButton.setTitleColor(UIColor.black, for: .normal)
        
        newActiveButton.setTitleColor(UIColor.white, for: .normal)
        newInactiveButton.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    func setNewVariables(currentVC: ViewController, nextVC: ViewController) {
        
        if currentVC.country != nil {
            nextVC.country = translate.country(language: UserDefaults.standard.string(forKey: "language")!, word: currentVC.country)
        }
        if currentVC.person != nil {
            nextVC.person = translate.person(language: UserDefaults.standard.string(forKey: "language")!, word: currentVC.person)
        }
        if currentVC.tertiaryDatum != nil {
            // might solve
            //let country = translate.country(language: currentVC.language, word: currentVC.country)
            nextVC.tertiaryDatum = translate.tertiary(language: UserDefaults.standard.string(forKey: "language")!, country: currentVC.country, word: currentVC.tertiaryDatum!)
        }
        
    }
    
    // the xTranslation and transformations probably shouldn't be in this
    func setNewButtonText(currentVC: ViewController, nextVC: ViewController) {
        
        if nextVC.country == nil {
            let translatedQuestion = translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.countriesTextButton.titleLabel!.text!)
            nextVC.countriesTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            print("null")
            nextVC.countriesTextButton.setTitle(nextVC.country, for: .normal)
        }
        
        if nextVC.person == nil {
            let translatedQuestion = translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.peopleTextButton.titleLabel!.text!)
            nextVC.peopleTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.peopleTextButton.setTitle(nextVC.person, for: .normal)
        }
        
        if nextVC.tertiaryTextButton != nil {
            if nextVC.tertiaryDatum == nil {
                let translatedQuestion = translate.question(language: UserDefaults.standard.string(forKey: "language")!, question: currentVC.tertiaryTextButton!.titleLabel!.text!)
                nextVC.tertiaryTextButton!.setTitle(translatedQuestion, for: .normal)
            } else {
                nextVC.tertiaryTextButton!.setTitle(nextVC.tertiaryDatum, for: .normal)
            }
        }
        
        // this puts the result on the other page
        if currentVC.formOfYouLabel.isHidden == false {
            nextVC.formOfYouLabel.isHidden = false
            nextVC.formOfYouLabel.text = currentVC.formOfYouLabel.text
            nextVC.view.setNeedsLayout()
        }
        
    }
    
    func setNewDropdownOptions(currentVC: ViewController, nextVC: ViewController) {
        
        // I might be able to turn this into a generic and call it a few times, not sure if thats better or not
        
        var buttonCountry = 0
        
        for horizontalView in nextVC.countriesDropdown.subviews {
            for case let button as UIButton in horizontalView.subviews {
                let translatedCountry = translate.country(language: UserDefaults.standard.string(forKey: "language")!, word: button.titleLabel!.text!)
                button.setTitle(translatedCountry, for: .normal)
                buttonCountry += 1
            }
        }
        
        for case let button as UIButton in nextVC.peopleDropdown.subviews {
            let translatedPerson = translate.person(language: UserDefaults.standard.string(forKey: "language")!, word: button.titleLabel!.text!)
            button.setTitle(translatedPerson, for: .normal)
        }
        
        if nextVC.tertiaryDropdown != nil {
            for case let button as UIButton in nextVC.tertiaryDropdown!.subviews {
                let translatedTertiary = translate.tertiary(language: UserDefaults.standard.string(forKey: "language")!, country: currentVC.country, word: button.titleLabel!.text!)
                button.setTitle(translatedTertiary, for: .normal)
            }
        }
        
    }
    
    func animateOut(currentVC: ViewController, xTranslation: CGFloat) {
        
        currentVC.countriesTextButtonCenterXConstraint.constant += xTranslation
        if currentVC.tertiaryTextButton != nil {
            currentVC.tertiaryTextButtonCenterXConstraint?.constant += xTranslation
        }
        currentVC.peopleTextButtonCenterXConstraint.constant += xTranslation
        UIView.animate(withDuration: 0.5, animations: {
            currentVC.view.layoutIfNeeded()
        })
        
    }
    
    func animateIn(nextVC: ViewController, xTranslation: CGFloat) {
        
        nextVC.countriesTextButtonCenterXConstraint.constant += xTranslation
        nextVC.peopleTextButtonCenterXConstraint.constant += xTranslation
        if nextVC.tertiaryTextButton != nil && UserDefaults.standard.string(forKey: "language") == "Espanol" {
            nextVC.tertiaryTextButtonCenterXConstraint?.constant += xTranslation
        }
        nextVC.view.layoutIfNeeded()
        
        nextVC.countriesTextButtonCenterXConstraint.constant -= xTranslation
        nextVC.peopleTextButtonCenterXConstraint.constant -= xTranslation
        if nextVC.tertiaryTextButton != nil {
            nextVC.tertiaryTextButtonCenterXConstraint?.constant -= xTranslation
        }
        UIView.animate(withDuration: 0.5, animations: {
            nextVC.view.layoutIfNeeded()
        })
        
    }
    
    // SIMPLIFICATION FUNCTION
    func translateAllTextButtons(vc: ViewController, xTranslation: CGFloat) {
        
        vc.countriesTextButtonCenterXConstraint.constant += xTranslation
        if vc.tertiaryTextButton != nil {
            vc.tertiaryTextButtonCenterXConstraint?.constant += xTranslation
        }
        vc.peopleTextButtonCenterXConstraint.constant += xTranslation
        UIView.animate(withDuration: 0.5, animations: {
            vc.view.layoutIfNeeded()
        })
        
    }
    
}
