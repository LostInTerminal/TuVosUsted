//
//  RefactoringIdeas.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

//LOOK AT MAKING MORE STUFF IN DATA STATIC
//ALSO MAYBE DONT PASS VC INTO FUNCTIONS?

import GoogleMobileAds
import UIKit

class Create {
    
    static func UIFor(vc: ViewController) {
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let vc = appDelegate.vc
        
        if UserDefaults.standard.bool(forKey: "baseElementsNeeded") && UserDefaults.standard.string(forKey: "language") == "English" {
            Create.uiElementGroup(vc: vc, dropdown: vc.uiElements.countriesDropdown, textButton: vc.uiElements.countriesTextButton, sectionTitle: vc.data.questions.inEnglish[0], buttonTitles: vc.data.countries.inEnglish, newElementsPosition: 1)
            Create.uiElementGroup(vc: vc, dropdown: vc.uiElements.peopleDropdown, textButton: vc.uiElements.peopleTextButton, sectionTitle: vc.data.questions.inEnglish[1], buttonTitles: vc.data.people.inEnglish, newElementsPosition: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                Match.allFontSizes(vc: vc)
            }
            UserDefaults.standard.set(false, forKey: "baseElementsNeeded")
        } else if UserDefaults.standard.string(forKey: "language") == "Español" {
            Create.uiElementGroup(vc: vc, dropdown: vc.uiElements.countriesDropdown, textButton: vc.uiElements.countriesTextButton, sectionTitle: vc.data.questions.inSpanish[0], buttonTitles: vc.data.countries.inSpanish, newElementsPosition: 1)
            Create.uiElementGroup(vc: vc, dropdown: vc.uiElements.peopleDropdown, textButton: vc.uiElements.peopleTextButton, sectionTitle: vc.data.questions.inSpanish[1], buttonTitles: vc.data.people.inSpanish, newElementsPosition: 2)
        }
        
        Create.languageButton(vc: vc, button: vc.uiElements.spanishButton, buttonTitle: "Español")
        vc.uiElements.spanishButton.addTarget(LanguageSelected.self, action: #selector(LanguageSelected.spanish(sender:)), for: .touchUpInside)
        
        Create.languageButton(vc: vc, button: vc.uiElements.englishButton, buttonTitle: "English")
        vc.uiElements.englishButton.addTarget(LanguageSelected.self, action: #selector(LanguageSelected.english(sender:)), for: .touchUpInside)
        
        Create.formOfYouLabel(vc: vc)
        
        Create.adBanner(vc: vc)
    }
    
    static func uiElementGroup(vc: ViewController, dropdown: UIStackView, textButton: UIButton, sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        
        let anchorValues = Style.AnchorValues()
        let size = Style.Size()
        
        let subviewCount = CGFloat(buttonTitles.count)
        
        dropdown.isHidden = true
        
        vc.view.addSubview(textButton)
        vc.view.addSubview(dropdown)
        
        textButton.setTitle(sectionTitle, for: .normal)
        
        switch textButton {
            
        case vc.uiElements.countriesTextButton:
            
            vc.uiElements.countriesTextButton.anchor(top: vc.view.topAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: anchorValues.textButtonTopPadding, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight))
            
            vc.uiElements.countriesDropdown.anchor(top: vc.uiElements.countriesTextButton.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: (size.boxHeight * subviewCount) / 2))
            
            vc.uiElements.countriesTextButton.addTarget(ActivateDropdown.self, action: #selector(ActivateDropdown.countries(_:)), for: .touchUpInside)
            
        case vc.uiElements.peopleTextButton:
            
            vc.uiElements.peopleTextButton.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: anchorValues.bottomTextButtonCenterYPadding, size: CGSize(width: size.boxWidth, height: size.boxHeight))
            
            vc.uiElements.peopleDropdown.anchor(top: vc.uiElements.peopleTextButton.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight * subviewCount))
            
            vc.uiElements.peopleTextButton.addTarget(ActivateDropdown.self, action: #selector(ActivateDropdown.people(_:)), for: .touchUpInside)
            
        case vc.uiElements.tertiaryTextButton:
            
            if newElementsPosition == 2 {
                
                vc.uiElements.tertiaryTextButton?.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.topAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: anchorValues.middleTextButtonCenterYPadding, size: CGSize(width: size.boxWidth, height: size.boxHeight))
                
                vc.uiElements.tertiaryDropdown?.anchor(top: vc.uiElements.tertiaryTextButton!.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: nil, centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight * subviewCount))
                
            } else if newElementsPosition == 3 {
                
                vc.uiElements.tertiaryTextButton?.anchor(top: nil, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: vc.view.centerYAnchor, padding: nil, centerXConstant: 0, centerYConstant: anchorValues.bottomTextButtonCenterYPadding, size: CGSize(width: size.boxWidth, height: size.boxHeight))
                
                vc.uiElements.tertiaryDropdown?.anchor(top: vc.uiElements.tertiaryTextButton!.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: nil, centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight * subviewCount))
                
            }
            
            vc.uiElements.tertiaryTextButton!.addTarget(ActivateDropdown.self, action: #selector(ActivateDropdown.tertiary(_:)), for: .touchUpInside)
            
        default:
            return
        }
        
        if dropdown == vc.uiElements.countriesDropdown {
            Populate.dropdownWithExtraLayer(vc: vc, buttonTitles: buttonTitles, dropdown: dropdown)
        } else {
            Populate.regularDropdown(vc: vc, buttonTitles: buttonTitles, dropdown: dropdown)
        }
        
        var maxOptionSize: CGFloat = 0
        
        // get font from the other dropdowns
        for case let button as UIButton in vc.uiElements.peopleDropdown.subviews {
            button.titleLabel?.font = button.titleLabel?.determineFontSizesBasedOnScreen(textType: "answer")
            let font = button.titleLabel?.determineStringSize(button: button, font: button.titleLabel!.font, myString: button.titleLabel?.text ?? "")
            maxOptionSize = max(font!.pointSize, maxOptionSize)
        }
        
        if dropdown == vc.uiElements.tertiaryDropdown {
            for case let button as UIButton in dropdown.subviews {
                button.titleLabel?.font = UIFont(name: "Meteoritox", size: maxOptionSize)!
            }
        }
        
    }
    
    static func formOfYouLabel(vc: ViewController) {
        
        let anchorValues = Style.AnchorValues()
        
        vc.uiElements.formOfYouLabel.isHidden = true
        vc.view.addSubview(vc.uiElements.formOfYouLabel)
        
        vc.uiElements.formOfYouLabel.anchor(top: vc.view.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: anchorValues.formOfYouLabelTopPadding, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0)
        
    }
    
    static func languageButton(vc: ViewController, button: UIButton, buttonTitle: String) {
        
        let anchorValues = Style.AnchorValues()
        let size = Style.Size()
        
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = button.titleLabel?.determineFontSizesBasedOnScreen(textType: "language")
        
        if UserDefaults.standard.string(forKey: "language") == buttonTitle {
            button.setTitleColor(UIColor.white, for: .normal)
        } else {
            button.setTitleColor(UIColor.black, for: .normal)
        }
        
        vc.view.addSubview(button)
        
        var englishButtonRightPadding: CGFloat!
        var spanishButtonRightPadding: CGFloat!
        
        if UIScreen.main.bounds.width < 768 {
            englishButtonRightPadding = anchorValues.englishButtonRightPaddingIPhone
            spanishButtonRightPadding = anchorValues.spanishButtonRightPaddingIPhone
        } else {
            if UIApplication.shared.statusBarOrientation.isPortrait {
                englishButtonRightPadding = anchorValues.englishButtonRightPaddingIPad
                spanishButtonRightPadding = anchorValues.spanishButtonRightPaddingIPad
            } else {
                englishButtonRightPadding = anchorValues.englishButtonRightPaddingIPadLandscape.adjHeight
                spanishButtonRightPadding = anchorValues.spanishButtonRightPaddingIPadLandscape.adjHeight
            }
        }
        
        if Style.DeviceTypeSizes.smallIPhone {
            spanishButtonRightPadding = anchorValues.spanishButtonRightPaddingSmallIPhone
        } else if Style.DeviceTypeSizes.mediumIPhone {
            spanishButtonRightPadding = -15
        }
        
        switch button {
            
        case vc.uiElements.spanishButton:
            
            vc.uiElements.spanishButton.anchor(top: vc.view.topAnchor, left: nil, bottom: nil, right: vc.view.rightAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: anchorValues.languageButtonTopPadding, left: 0, bottom: 0, right: spanishButtonRightPadding), centerXConstant: 0, centerYConstant: anchorValues.languageButtonTopPadding, size: CGSize(width: size.languageWidth, height: size.languageHeight))
            
        case vc.uiElements.englishButton:
            
            vc.uiElements.englishButton.anchor(top: vc.view.topAnchor, left: nil, bottom: nil, right: vc.uiElements.spanishButton.leftAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: anchorValues.languageButtonTopPadding, left: 0, bottom: 0, right: englishButtonRightPadding), centerXConstant: 0, centerYConstant: anchorValues.languageButtonTopPadding, size: CGSize(width: size.languageWidth, height: size.languageHeight))
            
        default:
            return
        }
        
    }
    
    static func adBanner(vc: ViewController) {
        vc.uiElements.bannerView.adUnitID = ""//"ca-app-pub-3940256099942544/2934735716"//"ca-app-pub-5699864355534180/7085636615"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        vc.uiElements.bannerView.rootViewController = appDelegate.vc
        vc.view.addSubview(vc.uiElements.bannerView)
        vc.uiElements.bannerView.anchor(top: vc.view.bottomAnchor, left: vc.view.leftAnchor, bottom: vc.view.bottomAnchor, right: vc.view.rightAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: -UIScreen.main.bounds.height * 0.1, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0)
        vc.uiElements.bannerView.load(GADRequest())
        
    }
    
    static func updateUIIfNeeded(vc: ViewController) {
        
        if vc.uiElements.tertiaryTextButton != nil {
            Obtain.newTertiaryDropdownValues(vc: vc)
            vc.view.layoutIfNeeded()
        } else if vc.uiElements.tertiaryTextButton == nil && vc.country != nil && (vc.data.tertiary.countriesInEnglish.contains(vc.country) || vc.data.tertiary.countriesInSpanish.contains(vc.country)) {
            Determine.ifTertiaryElementsAreNeeded(vc: vc, country: vc.country)
            if UserDefaults.standard.string(forKey: "language") == "English" && UserDefaults.standard.bool(forKey: "transitionOccuring") {
                vc.uiElements.tertiaryTextButton?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width * 2, y: 0)
            }
        }
        
        if vc.uiElements.tertiaryTextButton != nil {
            Animate.labelsVertically(vc: vc, country: vc.country)
        }
        
        if UserDefaults.standard.string(forKey: "language") == "Español" && UserDefaults.standard.bool(forKey: "transitionOccuring") {
            
            for case let questionButton as QuestionButton in vc.view.subviews {
                Obtain.newHeightConstraintFor(textButton: questionButton)
            }
            
        }
        
        Determine.ifFormOfYouShouldBeCalculated(vc: vc)
        
    }
    
}
