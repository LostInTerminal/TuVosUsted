//
//  Determine.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 3/1/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Determine {
    
    func ifAdditionalTextFieldIsNotNeeded(vc: ViewController, language: String, country: String) {
        
        let tertiary = Tertiary()
        let translation = Style.Ratios.twoTimesScreenWidth
        
        for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .horizontal) {
            if constraint.constant == 0 {
                if language == "English" && !tertiary.countriesInEnglish.contains(vc.country!) {
                    constraint.constant += translation
                } else if language == "Español" && !tertiary.countriesInSpanish.contains(vc.country!) {
                    constraint.constant -= translation
                } else { return }
            }
        }
        
        UserDefaults.standard.set(false, forKey: "tertiaryItemsAreOnScreen")
        
        UIView.animate(withDuration: 0.5, animations: {
            vc.view.layoutIfNeeded()
        }, completion: { (Bool) in
            vc.tertiaryTextButton = nil
            vc.tertiaryDropdown = nil
        })
        
    }
    
    func ifDropdownOptionsShouldBeChanged(language: String, country: String, tertiaryDatum: String) -> Bool {
        
        let tertiary = Tertiary()
        var dropdownOptionsShouldBeChanged = false
        
        if language == "English" && tertiary.countriesInEnglish.contains(country) {
            let countryArrayIndex = tertiary.countriesInEnglish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            if !countryArray.contains(tertiaryDatum) {
                dropdownOptionsShouldBeChanged = true
            }
        } else if language == "Español" && tertiary.countriesInSpanish.contains(country) {
            let countryArrayIndex = tertiary.countriesInSpanish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            if !countryArray.contains(tertiaryDatum) {
                dropdownOptionsShouldBeChanged = true
            }
        }
        
        return dropdownOptionsShouldBeChanged
        
    }
    
    func ifTertiaryQuestionMatchesValue(language: String, country: String) -> String {
        
        var question: String!
        let questions = Questions()
        var questionArray = [String]()
        
        if language == "English" {
            questionArray = questions.inEnglish
        } else if language == "Español" {
            questionArray = questions.inSpanish
        }
        
        if country == "El Salvador" {
            question = questionArray[3]
        } else if country == "Guatemala" || country == "Honduras" {
            question = questionArray[4]
        } else {
            question = questionArray[2]
            
        }
        
        return question
        
    }
    
    func ifTertiaryElementsAreNeeded(vc: ViewController, country: String) {
        
        let create = Create()
        let animate = Animation()
        let obtain = Obtain()
        
        var tertiaryArray = obtain.tertiaryData(language: UserDefaults.standard.string(forKey: "language")!, country: country)
        if tertiaryArray != [] {
            let sectionTitle = tertiaryArray[0]
            tertiaryArray.remove(at: 0)
            let newElementsPosition = Int((tertiaryArray.popLast())!)
            let buttonTitles = tertiaryArray
            vc.tertiaryTextButton = QuestionButton()
            vc.tertiaryDropdown = UIStackView()
            create.UIElementGroup(vc: vc, dropdown: vc.tertiaryDropdown!, textButton: vc.tertiaryTextButton!, sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
            vc.tertiaryTextButton?.titleLabel?.font = vc.countriesTextButton.titleLabel?.font
            vc.tertiaryTextButton?.addTarget(vc, action: #selector(vc.activateTertiaryDropdown), for: .touchUpInside)
            animate.tertiaryElements(vc: vc, language: UserDefaults.standard.string(forKey: "language")!, country: country)
        }
        
    }
    
    func ifFormOfYouShouldBeCalculated(vc: ViewController) {
        
        let tertiary = Tertiary()
        let obtain = Obtain()
        
        let calculateFormOfYou = DispatchWorkItem {
            if vc.country != nil && vc.person != nil {
                vc.formOfYouLabel.text = obtain.formOfYou(country: vc.country, person: vc.person, tertiaryDatum: vc.tertiaryDatum)
                vc.formOfYouLabel.isHidden = false
            }
        }
        
        // ADD "YOU" RESULT IF NEEDED
        if vc.country != nil && vc.person != nil {
            if tertiary.countriesInSpanish.contains(vc.country) || tertiary.countriesInEnglish.contains(vc.country) {
                if vc.tertiaryDatum == nil {
                    return
                } else {
                    calculateFormOfYou.perform()
                }
            } else {
                calculateFormOfYou.perform()
            }
        }
        
    }
    
}
