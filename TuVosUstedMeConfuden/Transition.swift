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
        // the following could also be region or i could combine the two
        if currentVC.tertiaryDatum != nil {
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
        
        // this may be need to check currentVC.tertiaryButtonsView instead depending on the order
        if nextVC.tertiaryButtonsView != nil {
            
            nextVC.tertiaryButtonsView?.transform = CGAffineTransform(translationX: xTranslation, y: 0)
            if nextVC.tertiaryDatum == nil {
                print("hallo")
                /*let translatedQuestion = translate.question(language: currentVC.language, question: currentVC.tertiaryTextButton!.titleLabel!.text!)
                print(nextVC.tertiaryTextButton)
                nextVC.tertiaryTextButton!.setTitle(translatedQuestion, for: .normal)*/
            } else {
                // this is like this because stuff gets when I copy the old subviews, maybe I should just call the tertiary stuff creation function instead so I can do this normally
                for case let textButton as UIButton in nextVC.tertiaryButtonsView!.subviews {
                    textButton.setTitle(nextVC.tertiaryDatum, for: .normal)
                }
            }
            
        }
        
        // this puts the result on the other page
        if currentVC.formOfYouLabel.isHidden == false {
            nextVC.formOfYouLabel.isHidden = false
            nextVC.formOfYouLabel.text = currentVC.formOfYouLabel.text
        }
        
    }
    
    func setNewDropdownOptions(currentVC: ViewController, nextVC: ViewController) {
        
        //if currentVC.language != "English" { return }
        
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
        
        var person = 0
        for case let button as UIButton in nextVC.peopleDropdown.subviews {
            let translatedPerson = translate.person(language: currentVC.language, word: button.titleLabel!.text!)
            button.setTitle(translatedPerson, for: .normal)
            person += 1
        }
        
        // might have to switch to current?
        if nextVC.tertiaryDropdown != nil {
            var option = 0
            for case let button as UIButton in nextVC.tertiaryDropdown!.subviews {
                let translatedTertiary = translate.tertiary(language: currentVC.language, country: nextVC.country, word: button.titleLabel!.text!)
                button.setTitle(translatedTertiary, for: .normal)
                option += 1
            }
        }
        
    }
    
    
    
}
