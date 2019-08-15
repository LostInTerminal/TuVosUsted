//
//  ActivateDropdown.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 6/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

@objcMembers class ActivateDropdown {
    
    static func countries(_ sender: UIButton) {
        
        print("activate countries")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        vc.view.bringSubviewToFront(vc.uiElements.countriesDropdown)
        
        Animate.dropdown(dropdown: vc.uiElements.countriesDropdown)
        
        for view in vc.uiElements.countriesDropdown.subviews {
            for case let button as UIButton in view.subviews {
                button.addTarget(OptionSelected.self, action: #selector(OptionSelected.country(_:)), for: .touchUpInside)
            }
        }
        
    }
    
    static func people(_ sender: UIButton) {
        
        print("activate people")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        vc.view.bringSubviewToFront(vc.uiElements.peopleDropdown)
        
        if vc.uiElements.tertiaryTextButton != nil {
            vc.view.sendSubviewToBack(vc.uiElements.tertiaryTextButton!)
        }
        
        Animate.dropdown(dropdown: vc.uiElements.peopleDropdown)
        
        for case let button as UIButton in vc.uiElements.peopleDropdown.subviews {
            button.addTarget(OptionSelected.self, action: #selector(OptionSelected.person(_:)), for: .touchUpInside)
        }
        
    }
    
    static func tertiary(_ sender: UIButton) {
        
        print("activate tertiary")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = appDelegate.vc
        
        if vc.uiElements.tertiaryDropdown != nil {
            vc.view.bringSubviewToFront(vc.uiElements.tertiaryDropdown!)
        }
        
        Animate.dropdown(dropdown: vc.uiElements.tertiaryDropdown!)
        
        for case let button as UIButton in vc.uiElements.tertiaryDropdown!.subviews {
            button.addTarget(OptionSelected.self, action: #selector(OptionSelected.tertiary(_:)), for: .touchUpInside)
        }
        
    }
    
}
