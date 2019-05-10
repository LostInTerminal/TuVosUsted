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
    var countriesTextButtonCenterXConstraint = NSLayoutConstraint()
    let peopleTextButton = TitleButton()
    let peopleDropdown = UIStackView()
    var peopleTextButtonCenterXConstraint = NSLayoutConstraint()
    var peopleTextButtonCenterYConstraint = NSLayoutConstraint()
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
    var tertiaryTextButtonCenterXConstraint: NSLayoutConstraint?
    var tertiaryTextButtonCenterYConstraint: NSLayoutConstraint?
    
    var tertiaryDropdown: UIStackView?
    var tertiaryDropdownCenterXConstraint: NSLayoutConstraint?
    var tertiaryDropdownCenterYConstraint: NSLayoutConstraint?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        // might need to bring countriesdropdown to front
        if UserDefaults.standard.string(forKey: "language") == "English" {
            createCountriesUIElements(sectionTitle: questions.inEnglish[0], buttonTitles: countries.inEnglish)
            createPeopleUIElements(sectionTitle: questions.inEnglish[1], buttonTitles: people.inEnglish)
        } else {
            createCountriesUIElements(sectionTitle: questions.inSpanish[0], buttonTitles: countries.inSpanish)
            createPeopleUIElements(sectionTitle: questions.inSpanish[1], buttonTitles: people.inSpanish)
        }
        
        createLanguageButtons()
        createFormOfYouLabel()
        
        addButtonTargets()
        
        //updateUIIfNeeded()
        
    }
    
    func createCountriesUIElements(sectionTitle: String, buttonTitles: [String]) {
        
        print("you shouldn't see me three times")
        
        countriesDropdown.isHidden = true
        
        populateDropdown(buttonTitles: buttonTitles, dropdown: countriesDropdown)
        
        countriesTextButton.frame = CGRect(x: 0, y: 0, width: Style.Size.boxWidth, height: Style.Size.boxHeight)
        countriesTextButton.setTitle(sectionTitle, for: .normal)
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        
        view.addSubview(countriesTextButton)
        view.addSubview(countriesDropdown)
        
        countriesTextButton.translatesAutoresizingMaskIntoConstraints = false
        countriesTextButtonCenterXConstraint = countriesTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        countriesTextButtonCenterXConstraint.isActive = true
        countriesTextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height / 8).isActive = true
        countriesTextButton.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        countriesTextButton.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
        
        countriesDropdown.translatesAutoresizingMaskIntoConstraints = false
        countriesDropdown.topAnchor.constraint(equalTo: countriesTextButton.bottomAnchor).isActive = true
        countriesDropdown.centerXAnchor.constraint(equalTo: countriesTextButton.centerXAnchor).isActive = true
        countriesDropdown.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        countriesDropdown.heightAnchor.constraint(equalToConstant: (Style.Size.boxHeight * CGFloat(buttonTitles.count)) / 2).isActive = true
        
        countriesTextButton.addDividers()
        
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
        peopleTextButtonCenterXConstraint = peopleTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        peopleTextButtonCenterXConstraint.isActive = true
        peopleTextButtonCenterYConstraint = peopleTextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25)
        peopleTextButtonCenterYConstraint.isActive = true
        peopleTextButton.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        peopleTextButton.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
        
        peopleDropdown.translatesAutoresizingMaskIntoConstraints = false
        peopleDropdown.topAnchor.constraint(equalTo: peopleTextButton.bottomAnchor).isActive = true
        peopleDropdown.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor).isActive = true
        peopleDropdown.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        peopleDropdown.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight * CGFloat(buttonTitles.count)).isActive = true
        
        peopleTextButton.addDividers()
        
    }
    
    func createFormOfYouLabel() {
        
        formOfYouLabel.translatesAutoresizingMaskIntoConstraints = false
        formOfYouLabel.isHidden = true
        formOfYouLabel.font = UIFont(name: "Meteoritox", size: 100)
        view.addSubview(formOfYouLabel)
        
        formOfYouLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formOfYouLabel.topAnchor.constraint(equalTo: peopleDropdown.bottomAnchor, constant: 0).isActive = true
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
        
        if tertiaryTextButton != nil {
            let newTitle = determine.ifTertiaryQuestionMatchesValue(language: UserDefaults.standard.string(forKey: "language")!, country: country)
            tertiaryTextButton?.setTitle(newTitle, for: .normal)
            view.layoutIfNeeded()
            
            rearrangeTextFieldsIfNeeded()
            UserDefaults.standard.set(true, forKey: "tertiaryItemsAreOnScreen")
            
            determine.ifAdditionalTextFieldIsNotNeeded(vc: self, language: UserDefaults.standard.string(forKey: "language")!, country: country)
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        if country != nil {
            updateUIIfNeeded()
        }
        
    }
    
    @objc func tertiaryButtonClicked(sender: UIButton) {
        
        tertiaryDropdown?.isHidden = true
        
        tertiaryDatum = sender.titleLabel?.text
        
        tertiaryTextButton?.setTitle(tertiaryDatum, for: .normal)
        
        if country != nil { // && person?
            // this is interfering w/ the text change for tertiaryTextButton
            updateUIIfNeeded()
        }
        
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
            tertiaryTextButtonCenterXConstraint = tertiaryTextButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            tertiaryTextButtonCenterXConstraint?.isActive = true
            tertiaryTextButtonCenterYConstraint = tertiaryTextButton?.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.3125)
            tertiaryTextButtonCenterYConstraint?.isActive = true
            // maybe set these to constant?
            tertiaryTextButton?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryTextButton?.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
            
            tertiaryDropdown?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryDropdown?.topAnchor.constraint(equalTo: tertiaryTextButton!.bottomAnchor).isActive = true
            tertiaryDropdown?.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
            tertiaryDropdown?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryDropdown?.heightAnchor.constraint(equalToConstant: 250).isActive = true
            
        } else if newElementsPosition == 3 {
            
            tertiaryTextButton?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryTextButtonCenterXConstraint = tertiaryTextButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            tertiaryTextButtonCenterXConstraint?.isActive = true
            tertiaryTextButtonCenterYConstraint = tertiaryTextButton?.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25)
            tertiaryTextButtonCenterYConstraint?.isActive = true
            tertiaryTextButton?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryTextButton?.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight).isActive = true
            
            tertiaryDropdown?.translatesAutoresizingMaskIntoConstraints = false
            tertiaryDropdown?.topAnchor.constraint(equalTo: tertiaryTextButton!.bottomAnchor).isActive = true
            tertiaryDropdown?.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
            tertiaryDropdown?.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
            tertiaryDropdown?.heightAnchor.constraint(equalToConstant: 250).isActive = true
            
        }
        
        tertiaryTextButton?.addDividers()
        
    }
    
    @objc func englishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "Espanol" {
            
            UserDefaults.standard.set(true, forKey: "transitionOccuring")
            
            let vc = presentingViewController as! ViewController
            
            DispatchQueue.main.async {
                self.transition.animateOut(currentVC: self, xTranslation: -UIScreen.main.bounds.width * 2)
                
                UserDefaults.standard.set("English", forKey: "language")
                
                self.transition.changeActiveButton(oldInactiveButton: self.englishButton, oldActiveButton: self.spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
                
                let tertiaryOptionNotYetSelected = (vc.tertiary.countriesInEnglish.contains(self.country) && self.tertiaryDatum != nil)
                if self.country != nil && self.person != nil && (tertiaryOptionNotYetSelected || !vc.tertiary.countriesInEnglish.contains(self.country)) {
                    vc.formOfYouLabel.text = self.formOfYouLabel.text
                    vc.formOfYouLabel.isHidden = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismiss(animated: false, completion: {
                        self.transition.animateIn(nextVC: vc, xTranslation: UIScreen.main.bounds.width * 2)
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
            if vc.tertiaryTextButton == nil {//&& vc.country != nil {
                var tertiaryArray = vc.determine.ifAdditionalTextFieldIsNeeded(language: UserDefaults.standard.string(forKey: "language")!, country: country)
                // THIS IS TURNING UP NIL
                if tertiaryArray != [] {
                    let sectionTitle = tertiaryArray[0]
                    tertiaryArray.remove(at: 0)
                    let newElementsPosition = Int((tertiaryArray.popLast())!)
                    let buttonTitles = tertiaryArray
                    vc.createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                    UserDefaults.standard.set(false, forKey: "tertiaryItemsAreOnScreen")
                    vc.rearrangeTextFieldsIfNeeded()
                    print("created")
                    // set to true?
                }
            }
            
            UserDefaults.standard.set("Espanol", forKey: "language")
            
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                self.transition.changeActiveButton(oldInactiveButton: self.spanishButton, oldActiveButton: self.englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
                
                self.transition.animateOut(currentVC: self, xTranslation: UIScreen.main.bounds.width * 2)
                
                // ADD "YOU" RESULT IF NEEDED
                let tertiaryOptionNotYetSelected = (vc.tertiary.countriesInSpanish.contains(self.country) && self.tertiaryDatum != nil)
                if self.country != nil && self.person != nil && (tertiaryOptionNotYetSelected || !vc.tertiary.countriesInSpanish.contains(self.country)) {
                    vc.formOfYouLabel.text = self.formOfYouLabel.text
                    vc.formOfYouLabel.isHidden = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.present(vc, animated: false, completion: {
                        self.transition.animateIn(nextVC: vc, xTranslation: -UIScreen.main.bounds.width * 2)
                        //self.transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
                        self.transition.setNewVariables(currentVC: self, nextVC: vc)
                        self.transition.setNewButtonText(currentVC: self, nextVC: vc)
                    })
                }
                
            }
            
            UserDefaults.standard.set(false, forKey: "transitionOccuring")
            
        }
        
    }
    
    func updateUIIfNeeded() {
        
        if tertiaryTextButton != nil {
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
        } else if tertiaryTextButton == nil && country != nil {
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
        
        // ADD "YOU" RESULT IF NEEDED
        if country != nil && person != nil {
            formOfYouLabel.text = determine.formOfYou(country: country, person: person, tertiaryDatum: tertiaryDatum)
            formOfYouLabel.isHidden = false
        }
    
    }
    
    func animateTertiaryElements(language: String, country: String) {
        
        // hacky fix for now
        if !(tertiary.countriesInEnglish.contains(country) || tertiary.countriesInSpanish.contains(country)) { return }
        
        // convert to simplification function
            
        if language == "English" {
            tertiaryTextButtonCenterXConstraint?.constant += UIScreen.main.bounds.width * 2
        } else if language == "Espanol" {
            tertiaryTextButtonCenterXConstraint?.constant -= UIScreen.main.bounds.width * 2
        }
        self.view.layoutIfNeeded()
        
        if language == "English" {
            tertiaryTextButtonCenterXConstraint?.constant -= UIScreen.main.bounds.width * 2
        } else if language == "Espanol" {
            tertiaryTextButtonCenterXConstraint?.constant += UIScreen.main.bounds.width * 2
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
            
            buttonTitles.forEach { (item) in
                
                if Int(button) % 2 == 0 {
                    x = 0
                    row = UIView(frame: CGRect(x: 0, y: dropdown.subviews.last?.frame.maxY ?? 0 * Style.Size.boxHeight, width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                } else {
                    x = 125
                }
                
                let option = OptionButton(frame: CGRect(x: x, y: 0, width: 125, height: 50))
                option.backgroundColor = view.backgroundColor
                option.setTitle(item, for: .normal)
                option.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
                dropdown.addSubview(option)
                row?.addSubview(option)
                
                button += 1
                
                if Int(button) % 2 != 0 {
                    dropdown.addSubview(row!)
                }
                
            }
            
        } else {
            
            var button: CGFloat = 0
            
            buttonTitles.forEach { (title) in
                let option = OptionButton(frame: CGRect(x: 0, y: button * Style.Size.boxHeight, width: Style.Size.boxWidth, height: Style.Size.boxHeight))
                option.backgroundColor = view.backgroundColor//UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)//UIColor.clear
                option.setTitle(title, for: .normal)
                
                dropdown.addSubview(option)
                
                button += 1
            }
            
        }
    
    }
    
    func rearrangeTextFieldsIfNeeded() {
        
        if country != "El Salvador" && country != "Guatemala" && country != "Honduras" && UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {

            peopleTextButtonCenterYConstraint.constant += (UIScreen.main.bounds.height * 0.1875 - 25)
            tertiaryTextButtonCenterYConstraint?.constant -= (UIScreen.main.bounds.height * 0.1875 - 25)
            
        } else if (country == "El Salvador" || country == "Guatemala" || country == "Honduras") {
            peopleTextButtonCenterYConstraint.constant -= (UIScreen.main.bounds.height * 0.1875 - 25)
            if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") {
                tertiaryTextButtonCenterYConstraint?.constant += (UIScreen.main.bounds.height * 0.1875 - 25)
            } else if UserDefaults.standard.bool(forKey: "transitionOccuring") {
                tertiaryTextButtonCenterYConstraint?.constant -= (UIScreen.main.bounds.height * 0.1875 - 25)
            }
            
        } else { return }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}

extension UIView {
    
    func addDividers() {
        
        let topBorderView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.01))
        let bottomBorderView = UIView(frame: CGRect(x: 0, y: frame.height * 0.999, width: frame.width, height: frame.height * 0.01))
        topBorderView.backgroundColor = UIColor.white
        bottomBorderView.backgroundColor = UIColor.white
        addSubview(topBorderView)
        addSubview(bottomBorderView)
        
    }
    
}
