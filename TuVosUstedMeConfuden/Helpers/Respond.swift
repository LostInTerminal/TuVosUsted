//
//  Respond.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

class Respond {
    
    func toNewCountry(vc: ViewController, country: String) {
        
        if vc.tertiary.specialOptions.contains(country) {
            UserDefaults.standard.set(true, forKey: "additionalInfoTertiaryWasActive")
        }
        
        if vc.tertiaryTextButton != nil {
            // This changes the question for tertiaryTextButton if it needs to be changed
            let newTitle = vc.determine.ifTertiaryQuestionMatchesValue(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            vc.tertiaryTextButton?.setTitle(newTitle, for: .normal)
            vc.view.layoutIfNeeded()
            
            // This determines if the country change has resulted in the need to get rid of the tertiaryStuff
            vc.determine.ifAdditionalTextFieldIsNotNeeded(vc: vc, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            
            // This rearranges the text field if the new question requires it
            vc.animate.labelsVertically(vc: vc, country: country)
            
            // this adjusted (now theres an issue with the dividers) the dividers if one country was changed to one of these three
            if vc.tertiaryTextButton != nil {
                vc.resize.countryTextButtonIfNeeded(vc: vc)
                vc.resize.tertiaryTextButtonIfNeeded(vc: vc)
            }
            
        }
        
    }
    
}
