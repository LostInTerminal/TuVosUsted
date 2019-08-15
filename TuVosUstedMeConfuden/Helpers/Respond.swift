//
//  Respond.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

class Respond {
    
    static func toNewCountry(vc: ViewController, country: String) {
        
        if vc.data.tertiary.specialOptions.contains(country) {
            UserDefaults.standard.set(true, forKey: "additionalInfoTertiaryWasActive")
        }
        
        if vc.uiElements.tertiaryTextButton != nil {
            
            // This changes the question for tertiaryTextButton if it needs to be changed
            let newTitle = Determine.ifTertiaryQuestionMatchesValue(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            vc.uiElements.tertiaryTextButton?.setTitle(newTitle, for: .normal)
            vc.view.layoutIfNeeded()
            
            // This determines if the country change has resulted in the need to get rid of the tertiaryStuff
            Determine.ifAdditionalTextFieldIsNotNeeded(vc: vc, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            
        }
        
    }
    
}
