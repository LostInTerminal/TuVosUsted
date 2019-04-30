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
            nextVC.country = translate.country(language: currentVC.language, word: currentVC.country)
        }
        if currentVC.person != nil {
            nextVC.person = translate.person(language: currentVC.language, word: currentVC.person)
        }
        if currentVC.tertiaryDatum != nil {
            // might solve
            //let country = translate.country(language: currentVC.language, word: currentVC.country)
            nextVC.tertiaryDatum = translate.tertiary(language: currentVC.language, country: currentVC.country, word: currentVC.tertiaryDatum!)
        }
        
    }
    
    // the xTranslation and transformations probably shouldn't be in this
    func setNewButtonText(currentVC: ViewController, nextVC: ViewController, xTranslation: CGFloat) {
        
        nextVC.countriesButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        if nextVC.country == nil {
            let translatedQuestion = translate.question(language: currentVC.language, question: currentVC.countriesTextButton.titleLabel!.text!)
            nextVC.countriesTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.countriesTextButton.setTitle(nextVC.country, for: .normal)
        }
        
        nextVC.peopleButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        if nextVC.person == nil {
            let translatedQuestion = translate.question(language: currentVC.language, question: currentVC.peopleTextButton.titleLabel!.text!)
            nextVC.peopleTextButton.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.peopleTextButton.setTitle(nextVC.person, for: .normal)
        }
        
        nextVC.tertiaryButtonsView?.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        if nextVC.tertiaryDatum == nil {
            let translatedQuestion = translate.question(language: currentVC.language, question: currentVC.tertiaryTextButton!.titleLabel!.text!)
            nextVC.tertiaryTextButton!.setTitle(translatedQuestion, for: .normal)
        } else {
            nextVC.tertiaryTextButton!.setTitle(nextVC.tertiaryDatum, for: .normal)
        }
        
        // this puts the result on the other page
        if currentVC.formOfYouLabel.isHidden == false {
            nextVC.formOfYouLabel.isHidden = false
            nextVC.formOfYouLabel.text = currentVC.formOfYouLabel.text
        }
        
    }
    
    func setNewDropdownOptions(currentVC: ViewController, nextVC: ViewController) {
        
        // I might be able to turn this into a generic and call it a few times, not sure if thats better or not
        
        var buttonCountry = 0
        var flagCountry = 0
        
        for horizontalView in nextVC.countriesDropdown.subviews {
            for case let button as UIButton in horizontalView.subviews {
                let translatedCountry = translate.country(language: currentVC.language, word: button.titleLabel!.text!)
                button.setTitle(translatedCountry, for: .normal)
                buttonCountry += 1
            }
            for case let imageView as UIImageView in horizontalView.subviews {
                let translatedImage = translate.image(language: currentVC.language, image: imageView.image!)
                imageView.image = translatedImage
                flagCountry += 1
            }
        }
        
        for case let button as UIButton in nextVC.peopleDropdown.subviews {
            let translatedPerson = translate.person(language: currentVC.language, word: button.titleLabel!.text!)
            button.setTitle(translatedPerson, for: .normal)
        }
        
        // HOW THE FUCK IS THIS WORKING?
        if nextVC.tertiaryDropdown != nil {
            for case let button as UIButton in nextVC.tertiaryDropdown!.subviews {
                print("set dropdown options")
                let translatedTertiary = translate.tertiary(language: currentVC.language, country: currentVC.country, word: button.titleLabel!.text!)
                button.setTitle(translatedTertiary, for: .normal)
            }
        }
        
    }
    
    func animateOut(currentVC: ViewController, xTranslation: CGFloat) {
        
        UIView.animate(withDuration: 0.5, animations: {
            currentVC.countriesButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
            currentVC.peopleButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
            if currentVC.tertiaryButtonsView != nil {
                currentVC.tertiaryButtonsView!.transform = CGAffineTransform(translationX: xTranslation, y: 0)
            }
        })
        
    }
    
    func animateIn(nextVC: ViewController) {
        
        UIView.animate(withDuration: 0.5, animations: {
            nextVC.countriesButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
            nextVC.peopleButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
            if nextVC.tertiaryButtonsView != nil {
                nextVC.tertiaryButtonsView!.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        })
        
    }
    
}
