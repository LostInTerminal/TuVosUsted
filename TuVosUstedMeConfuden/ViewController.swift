//
//  ViewController.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 2/26/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let englishButton = UIButton()
    let spanishButton = UIButton()
    let countriesTextButton = TitleButton()
    let countriesDropdown = UIStackView()
    let peopleTextButton = TitleButton()
    let peopleDropdown = UIStackView()
    let formOfYouLabel = CustomLabel()
    
    let transition = Transition()
    
    let create = Create()
    let determine = Determine()
    let questions = Questions()
    let countries = Countries()
    let people = People()
    let tertiary = Tertiary()
    let itemsToResize = ItemsToResize()
    let animate = Animation()
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    var tertiaryTextButton: TitleButton?
    var tertiaryDropdown: UIStackView?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        if UserDefaults.standard.bool(forKey: "baseElementsNeeded") && UserDefaults.standard.string(forKey: "language") == "English" {
            create.UIElementGroup(vc: self, dropdown: countriesDropdown, textButton: countriesTextButton, sectionTitle: questions.inEnglish[0], buttonTitles: countries.inEnglish, newElementsPosition: 1)
            create.UIElementGroup(vc: self, dropdown: peopleDropdown, textButton: peopleTextButton, sectionTitle: questions.inEnglish[1], buttonTitles: people.inEnglish, newElementsPosition: 2)
            UserDefaults.standard.set(false, forKey: "baseElementsNeeded")
        } else if UserDefaults.standard.string(forKey: "language") == "Español" {
            create.UIElementGroup(vc: self, dropdown: countriesDropdown, textButton: countriesTextButton, sectionTitle: questions.inSpanish[0], buttonTitles: countries.inSpanish, newElementsPosition: 1)
            create.UIElementGroup(vc: self, dropdown: peopleDropdown, textButton: peopleTextButton, sectionTitle: questions.inSpanish[1], buttonTitles: people.inSpanish, newElementsPosition: 2)
        }
        
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
        create.languageButton(vc: self, button: spanishButton, buttonTitle: "Español")
        spanishButton.addTarget(self, action: #selector(spanishButtonSelected), for: .touchUpInside)
        
        create.languageButton(vc: self, button: englishButton, buttonTitle: "English")
        englishButton.addTarget(self, action: #selector(englishButtonSelected), for: .touchUpInside)
        
        create.formOfYouLabel(vc: self)
        
    }
    
    @objc func countryClicked(sender: UIButton) {
         
        countriesDropdown.isHidden = true
        
        country = sender.titleLabel?.text
        countriesTextButton.setTitle(country, for: .normal)
        
        updateUIIfNeeded()
        
        checkIfResponseIsNeededToNewCountry()
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        updateUIIfNeeded()
        
    }
    
    @objc func tertiaryButtonClicked(sender: UIButton) {
        
        tertiaryDropdown?.isHidden = true
        
        tertiaryDatum = sender.titleLabel?.text
        
        tertiaryTextButton?.setTitle(tertiaryDatum, for: .normal)
        
        updateUIIfNeeded()
        
        checkIfTertiaryTextButtonShouldBeResized()
        
    }
    
    @objc func activateCountriesDropdown() {
        
        view.bringSubviewToFront(countriesDropdown)
        
        animate.dropdown(dropdown: countriesDropdown)
        
        for view in countriesDropdown.subviews {
            for case let button as UIButton in view.subviews {
                button.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
            }
        }
        
    }
    
    @objc func activatePeopleDropdown() {
        
        view.bringSubviewToFront(peopleDropdown)
        if tertiaryTextButton != nil {
            view.sendSubviewToBack(tertiaryTextButton!)
        }
        
        animate.dropdown(dropdown: peopleDropdown)
        
        for case let button as UIButton in peopleDropdown.subviews {
            button.addTarget(self, action: #selector(personClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func activateTertiaryDropdown() {
        
        view.bringSubviewToFront(tertiaryDropdown!)
        
        animate.dropdown(dropdown: tertiaryDropdown!)
        
        for case let button as UIButton in tertiaryDropdown!.subviews {
            button.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func englishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "Español" {
            
            UserDefaults.standard.set(true, forKey: "transitionOccuring")
            
            for case let dropdown as UIStackView in view.subviews {
                if !dropdown.isHidden {
                    dropdown.isHidden = true
                }
            }
            
            UserDefaults.standard.set("English", forKey: "language")
            
            let vc = presentingViewController as! ViewController
            
            DispatchQueue.main.async {
                
                self.transition.translateElements(currentVC: self, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                
                vc.transition.setNewVariables(currentVC: self, nextVC: vc)
                
                if self.tertiaryTextButton == nil && vc.tertiaryTextButton != nil {
                    vc.tertiaryTextButton = nil
                    vc.tertiaryDropdown = nil
                    if !self.itemsToResize.countriesWithLargeTertiaryQuestions.contains(self.country) {
                        for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
                            if UserDefaults.standard.bool(forKey: "transitionOccuring") {
                                if constraint.constant == -152.25 {
                                    constraint.constant += UIScreen.main.bounds.height * 0.1875 - 25
                                }
                            }
                        }
                    vc.view.layoutIfNeeded()
                    }
                } else {
                    vc.updateUIIfNeeded()
                }
                
                vc.transition.changeActiveButton(oldInactiveButton: self.englishButton, oldActiveButton: self.spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
                
                vc.calculateFormOfYou(vc: vc)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismiss(animated: false, completion: {
                        vc.transition.translateElements(currentVC: vc, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                        vc.transition.setNewButtonText(currentVC: self, nextVC: vc)
                        UserDefaults.standard.set(false, forKey: "transitionOccuring")
                    })
                }
            }
            
        }
        
    }
    
    @objc func spanishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            
            UserDefaults.standard.set(true, forKey: "transitionOccuring")
            
            for case let dropdown as UIStackView in view.subviews {
                if !dropdown.isHidden {
                    dropdown.isHidden = true
                }
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let vc = storyboard.instantiateInitialViewController() as? ViewController else { return }
            
            UserDefaults.standard.set("Español", forKey: "language")
            
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
            //DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.transition.translateElements(currentVC: self, xTranslation: Style.Ratios.twoTimesScreenWidth)
            //}
                
            self.transition.changeActiveButton(oldInactiveButton: self.spanishButton, oldActiveButton: self.englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
            
            self.calculateFormOfYou(vc: vc)
            
            vc.transition.setNewVariables(currentVC: self, nextVC: vc)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.present(vc, animated: false, completion: {
                    if self.tertiaryTextButton != nil && vc.tertiaryTextButton == nil {
                        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        vc.formTertiaryElements(vc: vc, country: vc.country)
                        //vc.resizeTextButtonsForSpanish()
                        //}
                        //vc.updateUIIfNeeded()
                    }
                    self.transition.animateIn(nextVC: vc, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                    self.transition.setNewButtonText(currentVC: self, nextVC: vc)
                })
            }
            
            UserDefaults.standard.set(false, forKey: "transitionOccuring")
            
        }
        
    }
    
    func updateUIIfNeeded() {
        
        if tertiaryTextButton != nil {
            changeTertiaryDropdown()
        } else if tertiaryTextButton == nil && country != nil && (tertiary.countriesInEnglish.contains(country) || tertiary.countriesInSpanish.contains(country)) {
            formTertiaryElements(vc: self, country: self.country)
        }
        
        if UserDefaults.standard.string(forKey: "language") == "Espanol" {
            resizeTextButtonsForSpanish()
        }
        
        calculateFormOfYou(vc: self)
    
    }
    
    func changeTertiaryDropdown() {
        
        if determine.ifDropdownOptionsShouldBeChanged(language: UserDefaults.standard.string(forKey: "language")!, country: country, tertiaryDatum: tertiaryDatum ?? "") {
            
            for case let button as UIButton in tertiaryDropdown!.subviews {
                button.removeFromSuperview()
            }
            
            var tertiaryArray = determine.obtainTertiaryData(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            if tertiaryArray != [] {
                tertiaryArray.remove(at: 0)
                tertiaryArray.popLast()
                let buttonTitles = tertiaryArray
                populateDropdown(buttonTitles: buttonTitles, dropdown: tertiaryDropdown!)
            }
            
        }
        
    }
    
    func formTertiaryElements(vc: ViewController, country: String) {
        
        var tertiaryArray = determine.obtainTertiaryData(language: UserDefaults.standard.string(forKey: "language")!, country: country)
        if tertiaryArray != [] {
            let sectionTitle = tertiaryArray[0]
            tertiaryArray.remove(at: 0)
            let newElementsPosition = Int((tertiaryArray.popLast())!)
            let buttonTitles = tertiaryArray
            tertiaryTextButton = TitleButton()
            tertiaryDropdown = UIStackView()
            create.UIElementGroup(vc: vc, dropdown: tertiaryDropdown!, textButton: tertiaryTextButton!, sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
            tertiaryTextButton?.addTarget(vc, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
            animate.tertiaryElements(vc: vc, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            animate.textFieldsVertically(vc: vc, country: country)
        }
        
    }
    
    func calculateFormOfYou(vc: ViewController) {
        
        let calculateFormOfYou = DispatchWorkItem {
            if self.country != nil && self.person != nil {
                vc.formOfYouLabel.text = vc.determine.formOfYou(country: self.country, person: self.person, tertiaryDatum: vc.tertiaryDatum)
                vc.formOfYouLabel.isHidden = false
            }
        }
        
        // ADD "YOU" RESULT IF NEEDED
        if country != nil && person != nil {
            if tertiary.countriesInSpanish.contains(country) || tertiary.countriesInEnglish.contains(country) {
                if tertiaryDatum == nil {
                    return
                } else {
                    calculateFormOfYou.perform()
                }
            } else {
                calculateFormOfYou.perform()
            }
        }
        
    }
    
    func populateDropdown(buttonTitles: [String], dropdown: UIStackView) {
        
        if dropdown == countriesDropdown {
            
            var button = 0.0
            var x = 0
            var row: UIView?
            
            buttonTitles.forEach { (item) in
                
                if Int(button) % 2 == 0 {
                    x = 0
                    row = UIView()
                    row?.backgroundColor = view.backgroundColor
                    dropdown.addSubview(row!)
                    row?.anchor(top: dropdown.topAnchor, left: dropdown.leftAnchor, bottom: nil, right: dropdown.rightAnchor, centerX: view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: CGFloat(floor(button / 2)) * Style.Size.boxHeight, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                } else {
                    x = 125
                }
                
                let option = OptionButton()
                option.translatesAutoresizingMaskIntoConstraints = false
                
                var centerXAnchorConstant: CGFloat?
                if x == 0 {
                    centerXAnchorConstant = -Style.Size.boxWidth / 4
                } else if x == 125 {
                    centerXAnchorConstant = Style.Size.boxWidth / 4
                }
                row?.addSubview(option)
                option.anchor(top: row!.topAnchor, left: nil, bottom: nil, right: nil, centerX: dropdown.centerXAnchor, centerY: nil, padding: nil, centerXConstant: centerXAnchorConstant!, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth / 2, height: Style.Size.boxHeight))
                option.setTitle(item, for: .normal)
                option.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
                
                option.addDividers(heightMultiplier: 0.01)
                option.backgroundColor = view.backgroundColor
                
                button += 1
                
            }
            
        } else {
            
            var button: CGFloat = 0
            
            buttonTitles.forEach { (title) in
                let option = OptionButton(frame: CGRect(x: 0, y: button * Style.Size.boxHeight, width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                
                dropdown.addSubview(option)
                option.anchor(top: dropdown.topAnchor, left: nil, bottom: nil, right: nil, centerX: dropdown.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: button * Style.Size.boxHeight, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                option.backgroundColor = view.backgroundColor//UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)//UIColor.clear
                option.setTitle(title, for: .normal)
                
                option.addDividers(heightMultiplier: 0.01)
                
                button += 1
            }
            
        }
    
    }
    
    func checkIfResponseIsNeededToNewCountry() {
        
        if tertiaryTextButton != nil {
            // This changes the question for tertiaryTextButton if it needs to be changed
            let newTitle = determine.ifTertiaryQuestionMatchesValue(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            tertiaryTextButton?.setTitle(newTitle, for: .normal)
            view.layoutIfNeeded()
            
            // This determines if the country change has resulted in the need to get rid of the tertiaryStuff
            determine.ifAdditionalTextFieldIsNotNeeded(vc: self, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            
            // This rearranges the text field if the new question requires it
            //if UserDefaults.standard.bool(forKey: "additionalInfoTertiaryWasActive") {
                animate.textFieldsVertically(vc: self, country: country)
            //}
            
            // this adjusted (now theres an issue with the dividers) the dividers if one country was changed to one of these three
            checkIfTertiaryTextButtonShouldBeResized()
            
        }
        
    }
    
    func checkIfTertiaryTextButtonShouldBeResized() {
        
        var heightMultiplier: CGFloat!
        var constraintToUpdate: NSLayoutConstraint!
        
        for constraint in tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == Style.Size.boxHeight || constraint.constant == Style.Size.boxHeight * 1.8 || constraint.constant == Style.Size.boxHeight * 2.6 {
                constraintToUpdate = constraint
            }
        }
        
        if (itemsToResize.countriesWithLargeTertiaryQuestions.contains(country) && questions.inEnglish.contains(tertiaryTextButton!.titleLabel!.text!)) || questions.inSpanish.contains(tertiaryTextButton!.titleLabel!.text!) || itemsToResize.mediumRegions.contains(tertiaryDatum ?? "") {
            constraintToUpdate.constant = Style.Size.boxHeight * 1.8//Style.Size.boxHeight * 2
            heightMultiplier = 0.005
        } else if itemsToResize.largeRegions.contains(tertiaryDatum ?? "") {
            constraintToUpdate.constant = Style.Size.boxHeight * 2.6//Style.Size.boxHeight * 3
            heightMultiplier = 0.0033
        } else {
            constraintToUpdate.constant = Style.Size.boxHeight
            heightMultiplier = 0.01
        }
        self.view.layoutIfNeeded()
        tertiaryTextButton?.removeSubviews()
        tertiaryTextButton?.addDividers(heightMultiplier: heightMultiplier)
        
    }
    
    func resizeTextButtonsForSpanish() {
        
        let heightMultiplier: CGFloat = 0.005
        let originalSize: CGFloat = Style.Size.boxHeight
        let newSize: CGFloat = Style.Size.boxHeight * 1.8
        
        for constraint in countriesTextButton.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == originalSize || constraint.constant == newSize {
                let constraintToUpdate = constraint
                constraintToUpdate.constant = questions.inSpanish.contains(countriesTextButton.titleLabel!.text!) ? newSize : originalSize
            }
        }
        
        for constraint in peopleTextButton.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == originalSize || constraint.constant == newSize {
                let constraintToUpdate = constraint
                constraintToUpdate.constant = questions.inSpanish.contains(peopleTextButton.titleLabel!.text!) ? newSize : originalSize
            }
        }
        
        if tertiaryTextButton != nil {
            for constraint in tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
                if constraint.constant == originalSize || constraint.constant == newSize {
                    let constraintToUpdate = constraint
                    constraintToUpdate.constant = questions.inSpanish.contains(peopleTextButton.titleLabel!.text!) ? newSize : originalSize
                }
            }
        }
        
        self.view.layoutIfNeeded()
        tertiaryTextButton?.removeSubviews()
        tertiaryTextButton?.addDividers(heightMultiplier: heightMultiplier)
        
    }
    
}
