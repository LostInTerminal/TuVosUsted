//
//  RefactoringIdeas.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Create {
    
    func UIElementGroup(vc: ViewController, dropdown: UIStackView, textButton: UIButton, sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        
        let subviewCount = CGFloat(buttonTitles.count)
        
        dropdown.isHidden = true
        
        vc.view.addSubview(textButton)
        vc.view.addSubview(dropdown)
        
        textButton.setTitle(sectionTitle, for: .normal)
        
        switch textButton {
            
        case vc.countriesTextButton:
            
            vc.countriesTextButton.anchor(top: vc.view.topAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: Style.AnchorValues.topTextButtonTop, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
            
            vc.countriesDropdown.anchor(top: vc.countriesTextButton.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: (Style.Size.boxHeight * subviewCount) / 2))
            
        case vc.peopleTextButton:
            
            vc.peopleTextButton.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: Style.AnchorValues.bottomTextButtonCenterY, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
            
            vc.peopleDropdown.anchor(top: vc.peopleTextButton.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight * subviewCount))
            
        case vc.tertiaryTextButton:
            
            if newElementsPosition == 2 {
                
                vc.tertiaryTextButton?.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.topAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: Style.AnchorValues.middleTextButtonCenterY, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                
                vc.tertiaryDropdown?.anchor(top: vc.tertiaryTextButton!.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: nil, centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight * subviewCount))
                
            } else if newElementsPosition == 3 {
                
                vc.tertiaryTextButton?.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.centerYAnchor, padding: nil, centerXConstant: 0, centerYConstant: Style.AnchorValues.bottomTextButtonCenterY, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                
                vc.tertiaryDropdown?.anchor(top: vc.tertiaryTextButton!.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: nil, centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight * subviewCount))
                
            }
            
            UserDefaults.standard.set(true, forKey: "tertiaryItemsAreOnScreen")
            
        default:
            return
        }
        
        vc.populateDropdown(buttonTitles: buttonTitles, dropdown: dropdown)
        
        textButton.addDividers(heightMultiplier: 0.01)
        
        print("created")
        
    }
    
    func formOfYouLabel(vc: ViewController) {
        
        vc.formOfYouLabel.isHidden = true
        vc.view.addSubview(vc.formOfYouLabel)
        
        vc.formOfYouLabel.anchor(top: vc.view.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: Style.AnchorValues.formOfYouLabelTop, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.resultHeight))
        
    }
    
    func languageButton(vc: ViewController, button: UIButton, buttonTitle: String) {
        
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = Style.Fonts.answer!
        vc.view.addSubview(button)
        
        switch button {
            
        case vc.spanishButton:
            
            vc.spanishButton.anchor(top: nil, left: nil, bottom: nil, right: vc.view.rightAnchor, centerX: nil, centerY: vc.view.topAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: Style.AnchorValues.spanishButtonRight), centerXConstant: 0, centerYConstant: Style.AnchorValues.languageButtonCenter, size: CGSize(width: Style.Size.languageWidth, height: Style.Size.languageHeight))
            
        case vc.englishButton:
            
            vc.englishButton.anchor(top: nil, left: nil, bottom: nil, right: vc.spanishButton.leftAnchor, centerX: nil, centerY: vc.view.topAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: Style.AnchorValues.englishButtonRight), centerXConstant: 0, centerYConstant: Style.AnchorValues.languageButtonCenter, size: CGSize(width: Style.Size.languageWidth, height: Style.Size.languageHeight))
            
        default:
            return
        }
        
        if UserDefaults.standard.string(forKey: "language") == buttonTitle {
            button.setTitleColor(UIColor.white, for: .normal)
        } else {
            button.setTitleColor(UIColor.black, for: .normal)
        }
        
    }
    
}
