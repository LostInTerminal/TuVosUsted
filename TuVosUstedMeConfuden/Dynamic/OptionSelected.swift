//
//  OptionSelected.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 6/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

@objcMembers class OptionSelected {
    
    static func country(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        vc.uiElements.countriesDropdown.isHidden = true
        
        vc.country = sender.titleLabel?.text
        vc.uiElements.countriesTextButton.setTitle(vc.country, for: .normal)
        
        Create.updateUIIfNeeded(vc: vc)
        
        Respond.toNewCountry(vc: vc, country: vc.country)
        
        Obtain.newHeightConstraintFor(textButton: vc.uiElements.countriesTextButton)
        
    }
    
    static func person(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        vc.uiElements.peopleDropdown.isHidden = true
        
        vc.person = sender.titleLabel?.text
        vc.uiElements.peopleTextButton.setTitle(vc.person, for: .normal)
        
        Create.updateUIIfNeeded(vc: vc)
        
        Obtain.newHeightConstraintFor(textButton: vc.uiElements.peopleTextButton)
        
    }
    
    static func tertiary(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        vc.uiElements.tertiaryDropdown?.isHidden = true
        
        vc.tertiaryDatum = sender.titleLabel?.text
        
        vc.uiElements.tertiaryTextButton?.setTitle(vc.tertiaryDatum, for: .normal)
        
        Create.updateUIIfNeeded(vc: vc)
        
        Obtain.newHeightConstraintFor(textButton: vc.uiElements.tertiaryTextButton!)
        
    }
    
}
