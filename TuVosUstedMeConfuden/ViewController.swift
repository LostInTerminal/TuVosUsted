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
    
    let determine = Determine()
    let constants = Constants()
    var buttonViews = [UIView]()
    var country: String!
    var person: String!
    var region: String?
    var additionalInfo: String?
    
    var tertiaryButtonsView: UIView?
    var tertiaryTextButton: UIButton?
    var tertiaryDropdown: UIView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        buttonViews.append(countriesButtonsView)
        buttonViews.append(peopleButtonsView)
        
        countriesTextButton.titleLabel?.numberOfLines = 2
        peopleTextButton.titleLabel?.numberOfLines = 2
        
        addButtonTargets()
        
        setCurrentLanguage()
    }
    
    func addButtonTargets() {
        
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        countriesArrowButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        peopleArrowButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
    }
    
    @objc func countryClicked(sender: UIButton) {
        
        countriesDropdown.isHidden = true
        for view in view.subviews {
            if buttonViews.contains(view) {
                view.isHidden = false
            }
        }
        
        country = sender.titleLabel?.text
        countriesTextButton.setTitle(country, for: .normal)
        
        updateUIIfNeeded()
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        for view in view.subviews {
            if buttonViews.contains(view) {
                view.isHidden = false
            }
        }
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        if country != nil {
            updateUIIfNeeded()
        }
        
    }
    
    @objc func tertiaryButtonClicked(sender: UIButton) {
        
        print("tertiaryButtonClicked")
        
        tertiaryButtonsView?.isHidden = true
        for view in view.subviews {
            if buttonViews.contains(view) {
                view.isHidden = false
            }
        }
        
        // the following could also be additionalInfo but I'm doing this for now
        region = sender.titleLabel?.text
        tertiaryTextButton?.setTitle(region, for: .normal)
        
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
        
        for case let button as UIButton in tertiaryDropdown!.subviews {
            button.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    func createFlyInStackView(sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        tertiaryButtonsView = UIView()
        
        tertiaryTextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        tertiaryTextButton?.setTitleColor(UIColor.black, for: .normal)
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
            tertiaryButtonsView?.frame = CGRect(x: countriesButtonsView.frame.minX, y: countriesButtonsView.frame.maxY + ((414-155)/2) - 50, width: 250, height: 50)
            /*sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 0)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: -208.5)*/
            
        } else if newElementsPosition == 3 {
            
            tertiaryButtonsView?.frame = peopleDropdown.frame
            /*sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 208.5)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: 208.5)*/
            
        }
        
        tertiaryDropdown = UIView(frame: CGRect(x: tertiaryButtonsView!.frame.minX, y: tertiaryButtonsView!.frame.maxY, width: 0, height: 0))
        tertiaryDropdown?.isUserInteractionEnabled = false
        tertiaryDropdown?.isHidden = true
        
        var titleNum = 0
        buttonTitles.forEach { (title) in
            let option = UIButton()
            option.frame = CGRect(x: 0, y: titleNum * 50, width: 250, height: 50)
            option.titleLabel?.numberOfLines = 2
            option.titleLabel?.textAlignment = .center
            option.backgroundColor = UIColor.white
            option.setTitle(title, for: .normal)
            option.setTitleColor(UIColor.black, for: .normal)
            
            tertiaryDropdown?.addSubview(option)
            titleNum += 1
        }
        
        tertiaryTextButton?.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
        tertiaryArrowButton.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
        
        // this is the fly-in animation part, for now this is how i'm going to do it but the fly-in direction will vary based on the language selected
        let transform = CGAffineTransform(translationX: view.frame.width * 2, y: 0)
        tertiaryButtonsView?.transform = transform
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tertiaryButtonsView?.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        //
        
        view.addSubview(tertiaryButtonsView!)
        view.addSubview(tertiaryDropdown!)
        
    }
    
    @IBAction func englishButtonSelected(_ sender: UIButton) {
        
        if englishButton.titleLabel?.textColor == UIColor.black {
            
            let vc = presentingViewController as! ViewController
            // might not need following line
            //vc.language = "English"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.countriesButtonsView.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                self.peopleButtonsView.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                if self.tertiaryButtonsView != nil {
                    
                    if vc.tertiaryButtonsView == nil {
                        self.maintainTertiaryElements(currentVC: self, nextVC: vc)
                    }
                    
                    self.tertiaryButtonsView!.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                }
            })
            
            switchActiveButtons(oldInactiveButton: englishButton, oldActiveButton: spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
            
            maintainInput(nextVC: vc, currentCountryArray: constants.paisesEnEspanol, nextCountryArray: constants.countriesInEnglish, currentPersonArray: constants.personasEnEspanol, nextPersonArray: constants.peopleInEnglish, rearrangeArray: constants.paisesEnMovimiento, switchArray: constants.movingCountries)
            
            maintainUI(nextVC: vc, xTranslation: vc.view.frame.width * 2, currentQuestion1: constants.preguntasEnEspanol[0], currentQuestion2: constants.preguntasEnEspanol[1], nextQuestion1: constants.questionsInEnglish[0], nextQuestion2: constants.questionsInEnglish[1])
            
            switchDropdownOptionsToNewLanguage(vc: vc, questionArray: vc.constants.questionsInEnglish, countryArray: vc.constants.countriesInEnglish, peopleArray: vc.constants.peopleInEnglish, imageArray: vc.constants.englishImageOrder)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                self.dismiss(animated: false, completion: {
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        vc.countriesButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
                        vc.peopleButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
                        if self.tertiaryButtonsView != nil {
                            
                            vc.tertiaryButtonsView!.transform = CGAffineTransform(translationX: 0, y: 0)
                            
                        }
                    })
                    
                })
                
            }
            
        }
        
    }
    
    @IBAction func spanishButtonSelected(_ sender: UIButton) {
        
        if spanishButton.titleLabel?.textColor == UIColor.black {
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let vc = storyboard.instantiateInitialViewController() as? ViewController else { return }
            //vc.language = "Espanol"
 
            UIView.animate(withDuration: 0.5, animations: {
                self.countriesButtonsView.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                self.peopleButtonsView.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                if self.tertiaryButtonsView != nil {
                        
                    if vc.tertiaryButtonsView == nil {
                        self.maintainTertiaryElements(currentVC: self, nextVC: vc)
                    }

                    self.tertiaryButtonsView!.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                }
            })
            
            // for some reason it wont run if i don't do the following
            print(vc.view.subviews)
            
            switchActiveButtons(oldInactiveButton: spanishButton, oldActiveButton: englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
            
            maintainInput(nextVC: vc, currentCountryArray: constants.countriesInEnglish, nextCountryArray: constants.paisesEnEspanol, currentPersonArray: constants.peopleInEnglish, nextPersonArray: constants.personasEnEspanol, rearrangeArray: constants.movingCountries, switchArray: constants.paisesEnMovimiento)
            
            maintainUI(nextVC: vc, xTranslation: -vc.view.frame.width * 2, currentQuestion1: constants.questionsInEnglish[0], currentQuestion2: constants.questionsInEnglish[1], nextQuestion1: constants.preguntasEnEspanol[0], nextQuestion2: constants.preguntasEnEspanol[1])
            
            switchDropdownOptionsToNewLanguage(vc: vc, questionArray: vc.constants.preguntasEnEspanol, countryArray: vc.constants.paisesEnEspanol, peopleArray: vc.constants.personasEnEspanol, imageArray: vc.constants.espanolOrdenImagen)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                self.present(vc, animated: false, completion: {
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        vc.countriesButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
                        vc.peopleButtonsView.transform = CGAffineTransform(translationX: 0, y: 0)
                        if self.tertiaryButtonsView != nil {
                            vc.tertiaryButtonsView!.transform = CGAffineTransform(translationX: 0, y: 0)
                        }
                    })
                    
                    
                })
                
            }
            
        }
        
    }
    
    func updateUIIfNeeded() {
        
        var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: language, country: country)
        if tertiaryArray != [] {
            let sectionTitle = tertiaryArray[0]
            tertiaryArray.remove(at: 0)
            let newElementsPosition = Int((tertiaryArray.popLast())!)
            let buttonTitles = tertiaryArray
            createFlyInStackView(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
        }
    
        if country != nil && person != nil {
            formOfYouLabel.text = determine.formOfYou(country: country, person: person, region: region, additionalInfo: additionalInfo)
            formOfYouLabel.isHidden = false
        }
    
    }
    
    func switchDropdownOptionsToNewLanguage(vc: ViewController, questionArray: [String], countryArray: [String], peopleArray: [String], imageArray: [UIImage]) {
        
        var buttonCountry = 0
        var flagCountry = 0
        for horizontalView in vc.countriesDropdown.subviews {
            for case let button as UIButton in horizontalView.subviews {
                button.setTitle(countryArray[buttonCountry], for: .normal)
                buttonCountry += 1
            }
            for case let imageView as UIImageView in horizontalView.subviews {
                imageView.image = imageArray[flagCountry]
                flagCountry += 1
            }
        }
        
        var person = 0
        for case let button as UIButton in vc.peopleDropdown.subviews {
            button.setTitle(peopleArray[person], for: .normal)
            person += 1
        }
        
        // add functionality for tertiary dropdown
        
    }
    
    func switchActiveButtons(oldInactiveButton: UIButton, oldActiveButton: UIButton, newActiveButton: UIButton, newInactiveButton: UIButton) {
        
        oldInactiveButton.setTitleColor(UIColor.white, for: .normal)
        oldActiveButton.setTitleColor(UIColor.black, for: .normal)
        
        newActiveButton.setTitleColor(UIColor.white, for: .normal)
        newInactiveButton.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    func maintainInput(nextVC: ViewController, currentCountryArray: [String], nextCountryArray: [String], currentPersonArray: [String], nextPersonArray: [String], rearrangeArray: [String], switchArray: [String]) {
        
        var countryIndexInArray: Array<String>.Index?
        var personIndexInArray: Array<String>.Index?
        
        if country != nil {
            countryIndexInArray = currentCountryArray.firstIndex(of: country)!
        }
        if person != nil {
            personIndexInArray = currentPersonArray.firstIndex(of: person)!
        }
        
        if countryIndexInArray != nil {
            
            let newCountry = nextCountryArray[countryIndexInArray!]
            
            if rearrangeArray.contains(country) {
                let index = rearrangeArray.firstIndex(of: country)!
                let reorderedNewCountry = switchArray[index]
                nextVC.country = reorderedNewCountry
            } else {
                nextVC.country = newCountry
            }
            
        }
        
        if personIndexInArray != nil {
            nextVC.person = nextPersonArray[personIndexInArray!]
        }
        
    }
    
    func maintainUI(nextVC: ViewController, xTranslation: CGFloat, currentQuestion1: String, currentQuestion2: String, nextQuestion1: String, nextQuestion2: String) {
        
        nextVC.countriesButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        if country == nil {
            nextVC.countriesTextButton.setTitle(nextQuestion1, for: .normal)
        } else {
            nextVC.countriesTextButton.setTitle(nextVC.country, for: .normal)
        }
        
        nextVC.peopleButtonsView.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        if person == nil {
            nextVC.peopleTextButton.setTitle(nextQuestion2, for: .normal)
        } else {
            nextVC.peopleTextButton.setTitle(nextVC.person, for: .normal)
        }
        
        if nextVC.tertiaryButtonsView != nil {
            print(xTranslation)
            nextVC.tertiaryButtonsView?.transform = CGAffineTransform(translationX: xTranslation, y: 0)
            if region == nil {
                print("change this to appropriate string later")
                //nextVC.tertiaryTextButton?.setTitle(nextQuestion2, for: .normal)
            } else {
                print("change this to appropriate string later")
                //nextVC.tertiaryTextButton?.setTitle(nextVC.region, for: .normal)
            }
            
        }
        
        if self.formOfYouLabel.isHidden == false {
            nextVC.formOfYouLabel.isHidden = false
            nextVC.formOfYouLabel.text = self.formOfYouLabel.text
        }
        
    }
    
    func maintainTertiaryElements(currentVC: ViewController, nextVC: ViewController) {
    
        do {
            nextVC.tertiaryButtonsView = try currentVC.tertiaryButtonsView?.copyObject()
            nextVC.tertiaryDropdown = try currentVC.tertiaryDropdown?.copyObject()
        } catch {
            print(error)
        }
        
        nextVC.view.addSubview(nextVC.tertiaryButtonsView!)
        nextVC.view.addSubview(nextVC.tertiaryDropdown!)
    
    }
    
    func setCurrentLanguage() {
        
        if presentingViewController == nil {
            language = "English"
        } else {
            language = "Espanol"
        }
        /*if englishButton.titleColor(for: .normal) == UIColor.white {
            language = "English"
        } else if spanishButton.titleColor(for: .normal) == UIColor.white {
            language = "Spanish"
        }*/
        
    }
    
}

