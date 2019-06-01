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
    let countriesTextButton = QuestionButton()
    let countriesDropdown = UIStackView()
    let peopleTextButton = QuestionButton()
    let peopleDropdown = UIStackView()
    let formOfYouLabel = FormOfYouLabel()
    
    let transition = Transition()
    let create = Create()
    let determine = Determine()
    let questions = Questions()
    let countries = Countries()
    let people = People()
    let tertiary = Tertiary()
    let itemsToResize = ItemsToResize()
    let animate = Animation()
    let resize = Resize()
    let match = Match()
    let respond = Respond()
    let obtain = Obtain()
    
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    var tertiaryTextButton: QuestionButton?
    var tertiaryDropdown: UIStackView?
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.backgroundColor = UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)
        
        super.viewWillAppear(true)
        
        if UserDefaults.standard.bool(forKey: "baseElementsNeeded") && UserDefaults.standard.string(forKey: "language") == "English" {
            create.UIElementGroup(vc: self, dropdown: countriesDropdown, textButton: countriesTextButton, sectionTitle: questions.inEnglish[0], buttonTitles: countries.inEnglish, newElementsPosition: 1)
            create.UIElementGroup(vc: self, dropdown: peopleDropdown, textButton: peopleTextButton, sectionTitle: questions.inEnglish[1], buttonTitles: people.inEnglish, newElementsPosition: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.match.allFontSizes(vc: self)
            }
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
        
        respond.toNewCountry(vc: self, country: country)
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        updateUIIfNeeded()
        
        resize.peopleTextButtonIfNeeded(vc: self)
        
    }
    
    @objc func tertiaryButtonClicked(sender: UIButton) {
        
        tertiaryDropdown?.isHidden = true
        
        tertiaryDatum = sender.titleLabel?.text
        
        tertiaryTextButton?.setTitle(tertiaryDatum, for: .normal)
        
        updateUIIfNeeded()
        
        resize.tertiaryTextButtonIfNeeded(vc: self)
        
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
            
            UserDefaults.standard.set("English", forKey: "language")
            
            let vc = presentingViewController as! ViewController
            
            transition.manage(currentVC: self, nextVC: vc, xTranslation: -Style.Ratios.twoTimesScreenWidth)
            
            DispatchQueue.main.async {
                
                // the following block happens before calculateFormOfYOU
                if self.tertiaryTextButton == nil && vc.tertiaryTextButton != nil {
                    vc.tertiaryTextButton = nil
                    vc.tertiaryDropdown = nil
                } else {
                    vc.updateUIIfNeeded()
                }
                
                vc.animate.labelsVertically(vc: vc, country: vc.country ?? "")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismiss(animated: false, completion: {
                        vc.transition.translateElements(currentVC: vc, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                        vc.transition.setNewButtonText(currentVC: self, nextVC: vc)
                    })
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    vc.resize.peopleTextButtonIfNeeded(vc: vc)
                    if vc.tertiaryTextButton != nil {
                        vc.resize.tertiaryTextButtonIfNeeded(vc: vc)
                    }
                    UserDefaults.standard.set(false, forKey: "transitionOccuring")
                })
            }
            
        }
        
    }
    
    @objc func spanishButtonSelected() {
        
        if UserDefaults.standard.string(forKey: "language") == "English" {
            
            let vc = ViewController()
            
            UserDefaults.standard.set("Español", forKey: "language")
            
            transition.manage(currentVC: self, nextVC: vc, xTranslation: Style.Ratios.twoTimesScreenWidth)
            
            // following happened before translateElements
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.present(vc, animated: false, completion: {
                    if self.tertiaryTextButton != nil && vc.tertiaryTextButton == nil {
                        self.determine.ifTertiaryElementsAreNeeded(vc: vc, country: vc.country)
                        if UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen") && UserDefaults.standard.bool(forKey: "transitionOccuring") && self.tertiary.specialOptions.contains(self.country) {
                            for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
                                if floor(constraint.constant) == floor(Style.AnchorValues.bottomTextButtonCenterYPadding) {
                                    constraint.constant -= Style.AnchorValues.verticalTranslation
                                }
                            }
                        }
                    }
                    self.transition.animateIn(nextVC: vc, xTranslation: -Style.Ratios.twoTimesScreenWidth)
                    self.transition.setNewButtonText(currentVC: self, nextVC: vc)
                })
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                if UserDefaults.standard.bool(forKey: "transitionOccuring") {
                    vc.resize.allTextButtonsForSpanish(vc: vc)
                }
                UserDefaults.standard.set(false, forKey: "transitionOccuring")
            }
            
        }
        
    }
    
    func updateUIIfNeeded() {
        
        if tertiaryTextButton != nil {
            obtain.newTertiaryDropdownValues(vc: self)
        } else if tertiaryTextButton == nil && country != nil && (tertiary.countriesInEnglish.contains(country) || tertiary.countriesInSpanish.contains(country)) {
            self.determine.ifTertiaryElementsAreNeeded(vc: self, country: self.country)
            if UserDefaults.standard.string(forKey: "language") == "English" && UserDefaults.standard.bool(forKey: "transitionOccuring") {
                tertiaryTextButton?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width * 2, y: 0)
            }
            animate.labelsVertically(vc: self, country: country)
        }
        
        if UserDefaults.standard.string(forKey: "language") == "Español" && UserDefaults.standard.bool(forKey: "transitionOccuring") {
            resize.allTextButtonsForSpanish(vc: self)
        }
        
        determine.ifFormOfYouShouldBeCalculated(vc: self)
    
    }
    
}
