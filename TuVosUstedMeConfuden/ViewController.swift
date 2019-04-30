//
//  ViewController.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 2/26/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var countriesTextButton: UIButton!
    @IBOutlet weak var countriesArrowButton: UIButton!
    @IBOutlet weak var countriesButtonsView: UIView!
    @IBOutlet weak var countriesDropdown: UIStackView!
    @IBOutlet weak var peopleDropdown: UIStackView!
    @IBOutlet weak var peopleTextButton: UIButton!
    @IBOutlet weak var peopleArrowButton: UIButton!
    @IBOutlet weak var peopleButtonsView: UIView!
    @IBOutlet weak var formOfYouLabel: UILabel!
    
    var language: String!
    var fuckMeVC: ViewController?
    
    let transition = Transition()
    
    let determine = Determine()
    let questions = Questions()
    let countries = Countries()
    let people = People()
    let images = Images()
    let tertiary = Tertiary()
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    var tertiaryButtonsView: UIView?
    var tertiaryTextButton: UIButton?
    var tertiaryDropdown: UIStackView?
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        countriesTextButton.titleLabel?.numberOfLines = 3
        peopleTextButton.titleLabel?.numberOfLines = 3
        countriesTextButton.titleLabel?.textAlignment = .center
        peopleTextButton.titleLabel?.textAlignment = .center
        
        addButtonTargets()
        
        setCurrentLanguage()
        
        updateUIIfNeeded()
        
    }
    
    func addButtonTargets() {
        
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        countriesArrowButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        peopleArrowButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
    }
    
    func setCurrentLanguage() {
        if englishButton.currentTitleColor == UIColor.white {
            language = "English"
        } else if spanishButton.currentTitleColor == UIColor.white {
            language = "Espanol"
        }
        
    }
    
    @objc func countryClicked(sender: UIButton) {
        
        countriesDropdown.isHidden = true
        
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        if tertiaryTextButton != nil {
            tertiaryButtonsView!.isHidden = !tertiaryButtonsView!.isHidden
        }
        
        country = sender.titleLabel?.text
        countriesTextButton.setTitle(country, for: .normal)
        
        updateUIIfNeeded()
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        // will need to reactivate tertiaryButtonView in the small case is beneath peopleButtonsView
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        if country != nil {
            updateUIIfNeeded()
        }
        
    }
    
    @objc func tertiaryButtonClicked(sender: UIButton) {
        
        tertiaryDropdown?.isHidden = true
        // will not need the following on the small chance that the tertiaryButtonsView is below peopleButtonsView
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        
        // the following could also be additionalInfo but I'm doing this for now
        tertiaryDatum = sender.titleLabel?.text
        
        tertiaryTextButton?.setTitle(tertiaryDatum, for: .normal)
        
        if country != nil {
            updateUIIfNeeded()
        }
        
    }
    
    @objc func activateCountriesDropdown() {
        
        countriesDropdown.isHidden = !countriesDropdown.isHidden
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        if tertiaryButtonsView != nil {
            tertiaryButtonsView!.isHidden = !tertiaryButtonsView!.isHidden
        }
        
        for subview in countriesDropdown.subviews {
            for case let button as UIButton in subview.subviews {
                button.addTarget(self, action: #selector(countryClicked(sender:)), for: .touchUpInside)
            }
        }
        
    }
    
    @objc func activatePeopleDropdown() {
        
        peopleDropdown.isHidden = !peopleDropdown.isHidden
        
        for case let button as UIButton in peopleDropdown.subviews {
            button.addTarget(self, action: #selector(personClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func activateTertiaryDropdown() {
        
        tertiaryDropdown!.isHidden = !tertiaryDropdown!.isHidden
        // the following will depend on position but for now i'm leaving it like this
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        
    }
    
    func createTertiaryElements(sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        
        tertiaryButtonsView = UIView()
        
        tertiaryTextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        tertiaryTextButton?.setTitleColor(UIColor.black, for: .normal)
        tertiaryTextButton?.titleLabel?.numberOfLines = 3
        tertiaryTextButton?.titleLabel?.textAlignment = .center
        let tertiaryArrowButton = UIButton(frame: CGRect(x: 212.5, y: 12.5, width: 25, height: 25))
        tertiaryArrowButton.setImage(UIImage(named: "arrow"), for: .normal)
        tertiaryTextButton?.setTitle(sectionTitle, for: .normal)
        
        tertiaryButtonsView?.addSubview(tertiaryTextButton!)
        tertiaryButtonsView?.addSubview(tertiaryArrowButton)
        
        if newElementsPosition == 2 {
            // moving already existing stuff at 2
            //peopleTextButton.centerYAnchor.constraint(equalTo: peopleTextButton.centerYAnchor, constant: 208.5)
            
            // adding
            //tertiaryButtonsView?.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
            let x = view.center.x - (countriesButtonsView.frame.width / 2) // should be 82
            tertiaryButtonsView?.frame = CGRect(x: x, y: countriesButtonsView.frame.maxY + ((414-155)/2) - 50, width: 250, height: 50)
            /*sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 0)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: -208.5)*/
            
        } else if newElementsPosition == 3 {
            tertiaryButtonsView?.frame = CGRect(x: peopleButtonsView.frame.minX, y: peopleButtonsView.frame.minY, width: 250, height: 50)
            //tertiaryButtonsView?.frame = CGRect(x: countriesButtonsView.frame.minX, y: countriesButtonsView.frame.maxY + ((414-155)/2) - 50, width: 250, height: 50)
            //tertiaryButtonsView?.frame = peopleDropdown.frame
            /*sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 208.5)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: 208.5)*/
            
        }
        
        tertiaryDropdown = UIStackView(frame: CGRect(x: tertiaryButtonsView!.frame.minX, y: tertiaryButtonsView!.frame.maxY, width: tertiaryButtonsView!.frame.width, height: 200))
        tertiaryDropdown?.isHidden = true
        
        populateTertiaryDropdown(buttonTitles: buttonTitles)
        
        tertiaryTextButton?.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
        tertiaryArrowButton.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
        
        view.addSubview(tertiaryButtonsView!)
        view.addSubview(tertiaryDropdown!)
    }
    
    @IBAction func englishButtonSelected(_ sender: UIButton) {
        
        if language == "Espanol" {
            
            let vc = presentingViewController as! ViewController
            
            DispatchQueue.main.async {
                self.transition.animateOut(currentVC: self, xTranslation: -self.view.frame.width * 2)
                
                self.transition.setNewVariables(currentVC: self, nextVC: vc)
                
                self.transition.changeActiveButton(oldInactiveButton: self.englishButton, oldActiveButton: self.spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.transition.setNewButtonText(currentVC: self, nextVC: vc, xTranslation: vc.view.frame.width * 2)
                    self.dismiss(animated: false, completion: {
                        self.transition.animateIn(nextVC: vc)
                    })
                }
            }
            
        }
        
    }
    
    @IBAction func spanishButtonSelected(_ sender: UIButton) {
        
        if language == "English" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let vc = storyboard.instantiateInitialViewController() as? ViewController else { return }
            
            print(vc.view.subviews)
            
            transition.setNewVariables(currentVC: self, nextVC: vc)
            
            transition.changeActiveButton(oldInactiveButton: spanishButton, oldActiveButton: englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
            
            // terrible code, but idfk how to fix this shit
            if vc.tertiaryButtonsView == nil && vc.country != nil {
                var tertiaryArray = vc.determine.ifAdditionalTextFieldIsNeeded(language: language, country: country)
                if tertiaryArray != [] {
                    let sectionTitle = tertiaryArray[0]
                    tertiaryArray.remove(at: 0)
                    let newElementsPosition = Int((tertiaryArray.popLast())!)
                    let buttonTitles = tertiaryArray
                    if vc.tertiaryDropdown == nil {
                        vc.createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                        vc.animateTertiaryElements(language: language, country: country)
                    }
                }
            }
            
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
            transition.setNewButtonText(currentVC: self, nextVC: vc, xTranslation: -vc.view.frame.width * 2)
                
            transition.animateOut(currentVC: self, xTranslation: self.view.frame.width * 2)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.present(vc, animated: false, completion: {
                    self.transition.animateIn(nextVC: vc)
                })
            }
            
        }
        
    }
    
    func updateUIIfNeeded() {
        if tertiaryButtonsView != nil { // IF TERTIARY STUFF EXISTS AND DATA HAS CHANGED
            determine.ifAdditionalTextFieldIsNotNeeded(vc: self, language: language, country: country)
            if determine.ifDropdownOptionsShouldBeChanged(language: language, country: country, tertiaryDatum: tertiaryDatum ?? "") {
                // this will definitely need to be refactored
                
                for case let button as UIButton in tertiaryDropdown!.subviews {
                    // want to nullify instead if possible
                    button.removeFromSuperview()
                }
                
                var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: language, country: country)
                if tertiaryArray != [] {
                    tertiaryArray.remove(at: 0)
                    tertiaryArray.popLast()
                    let buttonTitles = tertiaryArray
                    populateTertiaryDropdown(buttonTitles: buttonTitles)
                }
            }
        } else if tertiaryButtonsView == nil && country != nil { // CHECK IF TERTIARY STUFF IS NEEDED
            // this definitely needs to be refactored
            var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: language, country: country)
            if tertiaryArray != [] {
                let sectionTitle = tertiaryArray[0]
                tertiaryArray.remove(at: 0)
                let newElementsPosition = Int((tertiaryArray.popLast())!)
                let buttonTitles = tertiaryArray
                if tertiaryDropdown == nil {
                    createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                    animateTertiaryElements(language: language, country: country)
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
        
        var transform: CGAffineTransform!
        
        if country != "El Salvador" && country != "Guatemala" {
            if language == "English" {
                transform = CGAffineTransform(translationX: UIScreen.main.bounds.width * 2, y: 0)
                
                tertiaryButtonsView?.transform = transform
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.tertiaryButtonsView?.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            } else if language == "Espanol" {
                transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width * 2, y: 0)
                
                tertiaryButtonsView?.transform = transform
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.tertiaryButtonsView?.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        } else {
            let desiredYPosition = peopleButtonsView.frame.minY - countriesButtonsView.frame.minY
            let secondaryTransform = CGAffineTransform(translationX: 0, y: -(peopleButtonsView.frame.minY - desiredYPosition) - 25)
            UIView.animate(withDuration: 0.5, animations: {
                self.peopleButtonsView.transform = secondaryTransform
            })
            
            if language == "English" {
                transform = CGAffineTransform(translationX: UIScreen.main.bounds.width * 2, y: 0)
                
                tertiaryButtonsView?.transform = transform
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.tertiaryButtonsView?.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            } else if language == "Espanol" {
                transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width * 2, y: 0)
                
                tertiaryButtonsView?.transform = transform
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.tertiaryButtonsView?.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        }
 
    }
    
    func populateTertiaryDropdown(buttonTitles: [String]) {
    
        buttonTitles.forEach { (title) in
            let option = UIButton()
            option.frame = CGRect(x: 0, y: (tertiaryDropdown?.subviews.count)! * 50, width: 250, height: 50)
            option.titleLabel?.numberOfLines = 2
            option.titleLabel?.textAlignment = .center
            option.backgroundColor = UIColor.white
            option.setTitle(title, for: .normal)
            option.setTitleColor(UIColor.black, for: .normal)
            option.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
            
            tertiaryDropdown?.addSubview(option)
        }
    
    }
    
}

