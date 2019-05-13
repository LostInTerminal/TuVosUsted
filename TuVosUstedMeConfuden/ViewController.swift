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
    var countriesTextButtonCenterXAnchor = NSLayoutConstraint()
    var countriesTextButtonHeightAnchor = NSLayoutConstraint()
    let peopleTextButton = TitleButton()
    let peopleDropdown = UIStackView()
    var peopleTextButtonCenterXAnchor = NSLayoutConstraint()
    var peopleTextButtonCenterYAnchor = NSLayoutConstraint()
    var peopleTextButtonHeightAnchor = NSLayoutConstraint()
    let formOfYouLabel = CustomLabel()
    
    let transition = Transition()
    
    let determine = Determine()
    let questions = Questions()
    let countries = Countries()
    let people = People()
    let tertiary = Tertiary()
    let animation = Animation()
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    var tertiaryTextButton: TitleButton?
    var tertiaryTextButtonCenterXAnchor: NSLayoutConstraint?
    var tertiaryTextButtonCenterYAnchor: NSLayoutConstraint?
    var tertiaryTextButtonHeightAnchor: NSLayoutConstraint?
    
    var tertiaryDropdown: UIStackView?
    var tertiaryDropdownCenterXAnchor: NSLayoutConstraint?
    var tertiaryDropdownCenterYAnchor: NSLayoutConstraint?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        if UserDefaults.standard.bool(forKey: "baseElementsNeeded") && UserDefaults.standard.string(forKey: "language") == "English" {
            createCountriesUIElements(sectionTitle: questions.inEnglish[0], buttonTitles: countries.inEnglish)
            createPeopleUIElements(sectionTitle: questions.inEnglish[1], buttonTitles: people.inEnglish)
            UserDefaults.standard.set(false, forKey: "baseElementsNeeded")
        } else if UserDefaults.standard.string(forKey: "language") == "Espanol" {
            createCountriesUIElements(sectionTitle: questions.inSpanish[0], buttonTitles: countries.inSpanish)
            createPeopleUIElements(sectionTitle: questions.inSpanish[1], buttonTitles: people.inSpanish)
        }
        
        createLanguageButtons()
        createFormOfYouLabel()
        
        addButtonTargets()
        
        print(countriesTextButton)
        
    }
    
    func createCountriesUIElements(sectionTitle: String, buttonTitles: [String]) {
        
        countriesDropdown.isHidden = true
        
        view.addSubview(countriesTextButton)
        view.addSubview(countriesDropdown)
        
        //populateDropdown(buttonTitles: buttonTitles, dropdown: countriesDropdown)
        
        countriesTextButton.frame = CGRect(x: 0, y: 0, width: Style.Size.boxWidth, height: Style.Size.boxHeight)
        countriesTextButton.setTitle(sectionTitle, for: .normal)
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        
        countriesTextButton.translatesAutoresizingMaskIntoConstraints = false
        countriesTextButtonCenterXAnchor = countriesTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        countriesTextButtonCenterXAnchor.isActive = true
        countriesTextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 8).isActive = true
        countriesTextButton.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        countriesTextButtonHeightAnchor = countriesTextButton.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight)
        countriesTextButtonHeightAnchor.isActive = true
        
        countriesDropdown.translatesAutoresizingMaskIntoConstraints = false
        countriesDropdown.topAnchor.constraint(equalTo: countriesTextButton.bottomAnchor).isActive = true
        countriesDropdown.centerXAnchor.constraint(equalTo: countriesTextButton.centerXAnchor).isActive = true
        countriesDropdown.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        countriesDropdown.heightAnchor.constraint(equalToConstant: (Style.Size.boxHeight * CGFloat(buttonTitles.count)) / 2).isActive = true
        
        populateDropdown(buttonTitles: buttonTitles, dropdown: countriesDropdown)
        
        countriesTextButton.addDividers(heightAnchor: countriesTextButtonHeightAnchor, heightMultiplier: 0.01)
        
    }
    
    func createPeopleUIElements(sectionTitle: String, buttonTitles: [String]) {
        
        peopleDropdown.isHidden = true
        
        populateDropdown(buttonTitles: buttonTitles, dropdown: peopleDropdown)
        
        peopleTextButton.frame = CGRect(x: 0, y: 0, width: Style.Size.boxWidth, height: Style.Size.boxHeight)
        peopleTextButton.setTitle(sectionTitle, for: .normal)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
        view.addSubview(peopleTextButton)
        view.addSubview(peopleDropdown)
        
        peopleTextButton.translatesAutoresizingMaskIntoConstraints = false
        peopleTextButtonCenterXAnchor = peopleTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        peopleTextButtonCenterXAnchor.isActive = true
        peopleTextButtonCenterYAnchor = peopleTextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25)
        peopleTextButtonCenterYAnchor.isActive = true
        peopleTextButton.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        peopleTextButtonHeightAnchor = peopleTextButton.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight)
        peopleTextButtonHeightAnchor.isActive = true
        
        peopleDropdown.translatesAutoresizingMaskIntoConstraints = false
        peopleDropdown.topAnchor.constraint(equalTo: peopleTextButton.bottomAnchor).isActive = true
        peopleDropdown.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor).isActive = true
        peopleDropdown.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        peopleDropdown.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight * CGFloat(buttonTitles.count)).isActive = true
        
        peopleTextButton.addDividers(heightAnchor: peopleTextButtonHeightAnchor, heightMultiplier: 0.01)
        
    }
    
    func createFormOfYouLabel() {
        
        formOfYouLabel.translatesAutoresizingMaskIntoConstraints = false
        formOfYouLabel.isHidden = true
        formOfYouLabel.font = UIFont(name: "Meteoritox", size: 100)
        view.addSubview(formOfYouLabel)
        
        formOfYouLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formOfYouLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height * 0.25).isActive = true
        formOfYouLabel.heightAnchor.constraint(equalToConstant: Style.Size.resultHeight).isActive = true
        formOfYouLabel.widthAnchor.constraint(equalToConstant: Style.Size.resultWidth).isActive = true
        
    }
    
    func createLanguageButtons() {
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            englishButton.setTitleColor(UIColor.white, for: .normal)
            spanishButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            spanishButton.setTitleColor(UIColor.white, for: .normal)
            englishButton.setTitleColor(UIColor.black, for: .normal)
        }
        
        englishButton.setTitle("English", for: .normal)
        englishButton.translatesAutoresizingMaskIntoConstraints = false
        englishButton.titleLabel?.font = Style.Fonts.answer!
        englishButton.addTarget(self, action: #selector(englishButtonSelected), for: .touchUpInside)
        view.addSubview(englishButton)
        
        spanishButton.setTitle("Espanol", for: .normal)
        spanishButton.translatesAutoresizingMaskIntoConstraints = false
        spanishButton.titleLabel?.font = Style.Fonts.answer!
        spanishButton.addTarget(self, action: #selector(spanishButtonSelected), for: .touchUpInside)
        view.addSubview(spanishButton)
        spanishButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        spanishButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 16).isActive = true
        spanishButton.heightAnchor.constraint(equalToConstant: Style.Size.languageHeight).isActive = true
        spanishButton.widthAnchor.constraint(equalToConstant: Style.Size.languageWidth).isActive = true
        
        englishButton.rightAnchor.constraint(equalTo: spanishButton.leftAnchor, constant: -8).isActive = true
        englishButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 16).isActive = true
        englishButton.heightAnchor.constraint(equalToConstant: Style.Size.languageHeight).isActive = true
        englishButton.widthAnchor.constraint(equalToConstant: Style.Size.languageWidth).isActive = true
        
    }
    
    func addButtonTargets() {
        
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
    }
    
    @objc func countryClicked(sender: UIButton) {
         
        countriesDropdown.isHidden = true
        
        country = sender.titleLabel?.text
        
        countriesTextButton.setTitle(country, for: .normal)
        
        updateUIIfNeeded()
        
        // DO SOMETHING WITH THIS, CAN'T REMEMBER WHAT THIS WAS FOR
        if tertiaryTextButton != nil {
            let newTitle = determine.ifTertiaryQuestionMatchesValue(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            tertiaryTextButton?.setTitle(newTitle, for: .normal)
            view.layoutIfNeeded()
            
            if !tertiary.countriesInEnglish.contains(country) && !tertiary.countriesInSpanish.contains(country) {
                UserDefaults.standard.set(false, forKey: "tertiaryItemsAreOnScreen")
            }
            
            determine.ifAdditionalTextFieldIsNotNeeded(vc: self, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            rearrangeTextFieldsIfNeeded()
            
            if country == "El Salvador" || country == "Guatemala" || country == "Honduras" {
                tertiaryTextButtonHeightAnchor?.constant = Style.Size.boxHeight * 2
                self.view.layoutIfNeeded()
                tertiaryTextButton?.removeSubviews()
                // beware following !
                tertiaryTextButton?.addDividers(heightAnchor: tertiaryTextButtonHeightAnchor!, heightMultiplier: 0.005)
            }
            
            // TEMP
            /*UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }*/
            //
            
            if tertiary.countriesInEnglish.contains(country) || tertiary.countriesInSpanish.contains(country) {
                UserDefaults.standard.set(true, forKey: "tertiaryItemsAreOnScreen")
            }
            
            if country == "El Salvador" || country == "Guatemala" || country == "Honduras" {
                UserDefaults.standard.set(true, forKey: "additionalInfoTertiaryWasActive")
            } else {
                UserDefaults.standard.set(false, forKey: "additionalInfoTertiaryWasActive")
            }
        
        }
        
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
        
        var heightMultiplier: CGFloat!
        
        if country == "El Salvador" || country == "Guatemala" || country == "Honduras" {
            tertiaryTextButtonHeightAnchor?.constant = Style.Size.boxHeight * 2
            heightMultiplier = 0.005
            // the following should be switched to a .contain for these and 3 more (in 2 languages)
        } else if tertiaryDatum == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" || tertiaryDatum == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" || tertiaryDatum == "Quindío, Risaldo, Antioquia, or Risaralda States" || tertiaryDatum == "Estados de Quindío, Risaldo, Antioquia, o Risaralda" {
            tertiaryTextButtonHeightAnchor?.constant = Style.Size.boxHeight * 3
            heightMultiplier = 0.0033
        } else {
            tertiaryTextButtonHeightAnchor?.constant = Style.Size.boxHeight
            heightMultiplier = 0.01
        }
        self.view.layoutIfNeeded()
        tertiaryTextButton?.removeSubviews()
        // beware following bang
        tertiaryTextButton?.addDividers(heightAnchor: tertiaryTextButtonHeightAnchor!, heightMultiplier: heightMultiplier)
        
    }
    
    @objc func activateCountriesDropdown() {
        
        view.bringSubviewToFront(countriesDropdown)
        
        animation.animateDropdown(dropdown: countriesDropdown)
        
        for case let button as UIButton in countriesDropdown.subviews {
            button.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func activatePeopleDropdown() {
        
        view.bringSubviewToFront(peopleDropdown)
        
        animation.animateDropdown(dropdown: peopleDropdown)
        
        for case let button as UIButton in peopleDropdown.subviews {
            button.addTarget(self, action: #selector(personClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func activateTertiaryDropdown() {
        
        view.bringSubviewToFront(tertiaryDropdown!)
        
        animation.animateDropdown(dropdown: tertiaryDropdown!)
        
        for case let button as UIButton in tertiaryDropdown!.subviews {
            button.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    func createTertiaryElements(sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        
        tertiaryTextButton = TitleButton()
        tertiaryDropdown = UIStackView()
        tertiaryDropdown?.isHidden = true
        
        populateDropdown(buttonTitles: buttonTitles, dropdown: tertiaryDropdown!)
        
        tertiaryTextButton?.frame = CGRect(x: 0, y: 0, width: Style.Size.boxWidth, height: Style.Size.boxHeight)
        
        tertiaryTextButton?.setTitle(sectionTitle, for: .normal)
        tertiaryTextButton?.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
 
        view.addSubview(tertiaryTextButton!)
        view.addSubview(tertiaryDropdown!)
        
        if newElementsPosition == 2 {
            
            tertiaryTextButton?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryTextButtonCenterXAnchor = tertiaryTextButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            tertiaryTextButtonCenterXAnchor?.isActive = true
            tertiaryTextButtonCenterYAnchor = tertiaryTextButton?.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.3125)
            tertiaryTextButtonCenterYAnchor?.isActive = true
            tertiaryTextButton?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryTextButtonHeightAnchor = tertiaryTextButton?.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight)
            tertiaryTextButtonHeightAnchor?.isActive = true
            
            tertiaryDropdown?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryDropdown?.topAnchor.constraint(equalTo: tertiaryTextButton!.bottomAnchor).isActive = true
            tertiaryDropdown?.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
            tertiaryDropdown?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryDropdown?.heightAnchor.constraint(equalToConstant: 250).isActive = true
            
        } else if newElementsPosition == 3 {
            
            tertiaryTextButton?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryTextButtonCenterXAnchor = tertiaryTextButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            tertiaryTextButtonCenterXAnchor?.isActive = true
            tertiaryTextButtonCenterYAnchor = tertiaryTextButton?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25)
            tertiaryTextButtonCenterYAnchor?.isActive = true
            tertiaryTextButton?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryTextButtonHeightAnchor = tertiaryTextButton?.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight)
            tertiaryTextButtonHeightAnchor?.isActive = true
            
            tertiaryDropdown?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryDropdown?.topAnchor.constraint(equalTo: tertiaryTextButton!.bottomAnchor).isActive = true
            tertiaryDropdown?.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
            tertiaryDropdown?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryDropdown?.heightAnchor.constraint(equalToConstant: 250).isActive = true
            
        }
        
        tertiaryTextButton?.addDividers(heightAnchor: tertiaryTextButtonHeightAnchor!, heightMultiplier: 0.01)
        
    }
    
    @objc func englishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "Espanol" {
            
            UserDefaults.standard.set(true, forKey: "transitionOccuring")
            
            let vc = presentingViewController as! ViewController
            
            DispatchQueue.main.async {
                self.transition.animateOut(currentVC: self, xTranslation: -UIScreen.main.bounds.width * 2)
                
                UserDefaults.standard.set("English", forKey: "language")
                
                self.transition.changeActiveButton(oldInactiveButton: self.englishButton, oldActiveButton: self.spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
                
                // ADD "YOU" RESULT IF NEEDED
                if self.tertiaryDatum != nil {
                    let tertiaryOptionNotYetSelected = (vc.tertiary.countriesInEnglish.contains(self.country))
                    if self.country != nil && self.person != nil && (tertiaryOptionNotYetSelected || !vc.tertiary.countriesInEnglish.contains(self.country)) {
                        vc.formOfYouLabel.text = self.formOfYouLabel.text
                        vc.formOfYouLabel.isHidden = false
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismiss(animated: false, completion: {
                        //self.transition.animateIn(nextVC: vc, xTranslation: UIScreen.main.bounds.width * 2)
                        self.transition.translateAllTextButtons(vc: vc, xTranslation: -UIScreen.main.bounds.width * 2)
                        self.transition.setNewVariables(currentVC: self, nextVC: vc)
                        self.transition.setNewButtonText(currentVC: self, nextVC: vc)
                    })
                }
            }
            
             UserDefaults.standard.set(false, forKey: "transitionOccuring")
            
        }
        
    }
    
    @objc func spanishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            
            UserDefaults.standard.set(true, forKey: "transitionOccuring")
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let vc = storyboard.instantiateInitialViewController() as? ViewController else { return }
            
            print(vc.view.subviews)
            
            // terrible code, but idfk how to fix this shit
            if tertiaryTextButton != nil {
                var tertiaryArray = vc.determine.ifAdditionalTextFieldIsNeeded(language: UserDefaults.standard.string(forKey: "language")!, country: country)
                // THIS IS TURNING UP NIL
                if tertiaryArray != [] {
                    let sectionTitle = tertiaryArray[0]
                    tertiaryArray.remove(at: 0)
                    let newElementsPosition = Int((tertiaryArray.popLast())!)
                    let buttonTitles = tertiaryArray
                    vc.createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                    vc.rearrangeTextFieldsIfNeeded()
                    print("created")
                    // set to true?
                }
            }
            
            UserDefaults.standard.set("Espanol", forKey: "language")
            
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.transition.animateOut(currentVC: self, xTranslation: UIScreen.main.bounds.width * 2)
            }
                
            self.transition.changeActiveButton(oldInactiveButton: self.spanishButton, oldActiveButton: self.englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
            
            // ADD "YOU" RESULT IF NEEDED
            if self.tertiaryDatum != nil {
                let tertiaryOptionNotYetSelected = (vc.tertiary.countriesInSpanish.contains(self.country))
                if self.country != nil && self.person != nil && (tertiaryOptionNotYetSelected || !vc.tertiary.countriesInSpanish.contains(self.country)) {
                    vc.formOfYouLabel.text = self.formOfYouLabel.text
                    vc.formOfYouLabel.isHidden = false
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.present(vc, animated: false, completion: {
                    self.transition.animateIn(nextVC: vc, xTranslation: -UIScreen.main.bounds.width * 2)
                    //self.transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
                    self.transition.setNewVariables(currentVC: self, nextVC: vc)
                    self.transition.setNewButtonText(currentVC: self, nextVC: vc)
                })
            }
            
            UserDefaults.standard.set(false, forKey: "transitionOccuring")
            
        }
        
    }
    
    func updateUIIfNeeded() {
        
        if tertiaryTextButton != nil {
            changeTertiaryDropdown()
        } else if tertiaryTextButton == nil && country != nil {
            createNewTertiaryDropdown()
        }
        
        calculateFormOfYou()
    
    }
    
    func changeTertiaryDropdown() {
        
        if determine.ifDropdownOptionsShouldBeChanged(language: UserDefaults.standard.string(forKey: "language")!, country: country, tertiaryDatum: tertiaryDatum ?? "") {
            // this will definitely need to be refactored
            
            for case let button as UIButton in tertiaryDropdown!.subviews {
                // want to nullify instead if possible
                button.removeFromSuperview()
            }
            
            var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            if tertiaryArray != [] {
                tertiaryArray.remove(at: 0)
                tertiaryArray.popLast()
                let buttonTitles = tertiaryArray
                populateDropdown(buttonTitles: buttonTitles, dropdown: tertiaryDropdown!)
            }
        }
        
    }
    
    func createNewTertiaryDropdown() {
        // this definitely needs to be refactored
        
        var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: UserDefaults.standard.string(forKey: "language")!, country: country)
        if tertiaryArray != [] {
            let sectionTitle = tertiaryArray[0]
            tertiaryArray.remove(at: 0)
            let newElementsPosition = Int((tertiaryArray.popLast())!)
            let buttonTitles = tertiaryArray
            if tertiaryDropdown == nil {
                createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                animateTertiaryElements(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            }
        }
    }
    
    func calculateFormOfYou() {
        
        let calculateFormOfYou = DispatchWorkItem {
            if self.country != nil && self.person != nil {
                self.formOfYouLabel.text = self.determine.formOfYou(country: self.country, person: self.person, tertiaryDatum: self.tertiaryDatum)
                self.formOfYouLabel.isHidden = false
            }
        }
        
        // ADD "YOU" RESULT IF NEEDED
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
    
    func animateTertiaryElements(language: String, country: String) {
        
        // hacky fix for now
        if !(tertiary.countriesInEnglish.contains(country) || tertiary.countriesInSpanish.contains(country)) { return }
            
        if language == "English" {
            tertiaryTextButtonCenterXAnchor?.constant += UIScreen.main.bounds.width * 2
        } else if language == "Espanol" {
            tertiaryTextButtonCenterXAnchor?.constant -= UIScreen.main.bounds.width * 2
        }
        self.view.layoutIfNeeded()
        
        if language == "English" {
            tertiaryTextButtonCenterXAnchor?.constant -= UIScreen.main.bounds.width * 2
        } else if language == "Espanol" {
            tertiaryTextButtonCenterXAnchor?.constant += UIScreen.main.bounds.width * 2
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        
    }
    
    func populateDropdown(buttonTitles: [String], dropdown: UIStackView) {
        
        if dropdown == countriesDropdown {
            
            var button = 0.0
            var x = 0
            var row: UIView?
            var rowHeightAnchor: NSLayoutConstraint?
            
            buttonTitles.forEach { (item) in
                
                if Int(button) % 2 == 0 {
                    x = 0
                    //row = UIView(frame: CGRect(x: 0, y: dropdown.subviews.last?.frame.maxY ?? 0 * Style.Size.boxHeight, width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                    row = UIView()
                    row?.backgroundColor = view.backgroundColor
                    row?.translatesAutoresizingMaskIntoConstraints = false
                    dropdown.addSubview(row!)
                    //row?.topAnchor.constraint(equalTo: dropdown.topAnchor).isActive = true
                    row?.topAnchor.constraint(equalTo: dropdown.topAnchor, constant: CGFloat(floor(button / 2)) * Style.Size.boxHeight).isActive = true
                    row?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                    rowHeightAnchor = row?.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight)
                    rowHeightAnchor?.isActive = true
                    row?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
                    row?.addDividers(heightAnchor: rowHeightAnchor!, heightMultiplier: 0.01)
                } else {
                    x = 125
                }
                
                //let option = OptionButton(frame: CGRect(x: x, y: 0, width: 125, height: 50))
                let option = OptionButton()
                option.translatesAutoresizingMaskIntoConstraints = false
                row?.addSubview(option)
                option.topAnchor.constraint(equalTo: row!.topAnchor).isActive = true
                if x == 0 {
                    option.centerXAnchor.constraint(equalTo: dropdown.centerXAnchor, constant: -Style.Size.boxWidth / 4).isActive = true
                } else if x == 125 {
                    option.centerXAnchor.constraint(equalTo: dropdown.centerXAnchor, constant: Style.Size.boxWidth / 4).isActive = true
                }
                option.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
                option.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth / 2).isActive = true
                option.setTitle(item, for: .normal)
                option.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
                
                button += 1
                
            }
            
        } else {
            
            var button: CGFloat = 0
            
            buttonTitles.forEach { (title) in
                let option = OptionButton(frame: CGRect(x: 0, y: button * Style.Size.boxHeight, width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                
                dropdown.addSubview(option)
                
                option.translatesAutoresizingMaskIntoConstraints = false
                option.topAnchor.constraint(equalTo: dropdown.topAnchor, constant: button * Style.Size.boxHeight).isActive = true
                option.centerXAnchor.constraint(equalTo: dropdown.centerXAnchor).isActive = true
                option.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
                option.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
                option.backgroundColor = view.backgroundColor//UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)//UIColor.clear
                option.setTitle(title, for: .normal)
                
                button += 1
            }
            
        }
    
    }
    
    func rearrangeTextFieldsIfNeeded() {
        
        if country != "El Salvador" && country != "Guatemala" && country != "Honduras" && UserDefaults.standard.bool(forKey: "additionalInfoTertiaryWasActive") {
            
            peopleTextButtonCenterYAnchor.constant += (UIScreen.main.bounds.height * 0.1875 - 25)
            if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {
                tertiaryTextButtonCenterYAnchor?.constant -= (UIScreen.main.bounds.height * 0.1875 - 25)
            }
            
        } else if (country == "El Salvador" || country == "Guatemala" || country == "Honduras") && !UserDefaults.standard.bool(forKey: "additionalInfoTertiaryWasActive") {
            // if moving between countries of same category, this should be nullified
            peopleTextButtonCenterYAnchor.constant -= (UIScreen.main.bounds.height * 0.1875 - 25)
            if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {
                tertiaryTextButtonCenterYAnchor?.constant += (UIScreen.main.bounds.height * 0.1875 - 25)
            }
            
        } else { return }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}

extension UIView {
    
    func addDividers(heightAnchor: NSLayoutConstraint, heightMultiplier: CGFloat) {
        // .999 INSTEAD OF .99 DOESNT GIVE DOUBLED LOOK FOR SHARED BOTTOM/TOP
        
        let topBorderView = UIView()
        topBorderView.backgroundColor = UIColor.white
        topBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topBorderView)
        topBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topBorderView.heightAnchor.constraint(equalToConstant: heightAnchor.constant * heightMultiplier).isActive = true
        
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: heightAnchor.constant * heightMultiplier).isActive = true
        
    }
    
}

extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
