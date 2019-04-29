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
    
    let transition = Transition()
    
    let determine = Determine()
    let questions = Questions()
    let countries = Countries()
    let people = People()
    let movingCountries = MovingCountries() // I should be able to get rid of this one if the plan works out
    let images = Images()
    let tertiary = Tertiary()
    var buttonViews = [UIView]()
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    var tertiaryButtonsView: UIView?
    var tertiaryTextButton: UIButton?
    var tertiaryDropdown: UIStackView?
    
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
        
        print("activatePeopleDropdown")
        
        peopleDropdown.isHidden = !peopleDropdown.isHidden
        
        for case let button as UIButton in peopleDropdown.subviews {
            button.addTarget(self, action: #selector(personClicked(sender:)), for: .touchUpInside)
        }
        
    }
    
    @objc func activateTertiaryDropdown() {
        
        print("activateTertiaryDropdown")
        
        tertiaryDropdown!.isHidden = !tertiaryDropdown!.isHidden
        // the following will depend on position but for now i'm leaving it like this
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        
    }
    
    func createTertiaryElements(sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
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
        
        tertiaryDropdown = UIStackView(frame: CGRect(x: tertiaryButtonsView!.frame.minX, y: tertiaryButtonsView!.frame.maxY, width: tertiaryButtonsView!.frame.width, height: 200))
        //tertiaryDropdown?.isUserInteractionEnabled = false
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
            // look next
            option.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
            
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
        
        self.view.addSubview(self.tertiaryButtonsView!)
        self.view.addSubview(self.tertiaryDropdown!)
        
    }
    
    @IBAction func englishButtonSelected(_ sender: UIButton) {
        
        if englishButton.titleLabel?.textColor == UIColor.black {
            
            let vc = presentingViewController as! ViewController
            
            UIView.animate(withDuration: 0.5, animations: {
                self.countriesButtonsView.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                self.peopleButtonsView.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                if self.tertiaryButtonsView != nil {
                    
                    if vc.tertiaryButtonsView == nil {
                        vc.maintainNewTertiaryElements(currentVC: self, nextVC: vc)
                    }
                    
                    self.tertiaryButtonsView!.transform = CGAffineTransform(translationX: -self.view.frame.width * 2, y: 0)
                }
            })
            
            transition.changeActiveButton(oldInactiveButton: englishButton, oldActiveButton: spanishButton, newActiveButton: vc.englishButton, newInactiveButton: vc.spanishButton)
            
            transition.setNewVariables(currentVC: self, nextVC: vc)
            
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
 
            UIView.animate(withDuration: 0.5, animations: {
                self.countriesButtonsView.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                self.peopleButtonsView.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                if self.tertiaryButtonsView != nil {
                        
                    if vc.tertiaryButtonsView == nil {
                        vc.maintainNewTertiaryElements(currentVC: self, nextVC: vc)
                    }

                    self.tertiaryButtonsView!.transform = CGAffineTransform(translationX: self.view.frame.width * 2, y: 0)
                }
            })
            
            // for some reason it wont run if i don't do the following
            print(vc.view.subviews)
            
            transition.changeActiveButton(oldInactiveButton: spanishButton, oldActiveButton: englishButton, newActiveButton: vc.spanishButton, newInactiveButton: vc.englishButton)
            
            transition.setNewVariables(currentVC: self, nextVC: vc)
            
            transition.setNewButtonText(currentVC: self, nextVC: vc, xTranslation: -vc.view.frame.width * 2)
            
            transition.setNewDropdownOptions(currentVC: self, nextVC: vc)
            
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
        
        if tertiaryButtonsView?.superview != nil {
            determine.ifAdditionalTextFieldIsNotNeeded(vc: self, language: language, country: country)
        } else if tertiaryButtonsView?.superview == nil && tertiaryButtonsView != nil {
            view.addSubview(tertiaryButtonsView!)
            
            UIView.animate(withDuration: 0.5) {
                let transform = CGAffineTransform(translationX: 0, y: 0)
                self.tertiaryButtonsView?.transform = transform
            }
            
            view.addSubview(tertiaryDropdown!)
        } else {
            
            // this definitely needs to be refactored
            var tertiaryArray = determine.ifAdditionalTextFieldIsNeeded(language: language, country: country)
            if tertiaryArray != [] {
                let sectionTitle = tertiaryArray[0]
                tertiaryArray.remove(at: 0)
                let newElementsPosition = Int((tertiaryArray.popLast())!)
                let buttonTitles = tertiaryArray
                if tertiaryDropdown == nil {
                    createTertiaryElements(sectionTitle: sectionTitle, buttonTitles: buttonTitles, newElementsPosition: newElementsPosition!)
                }
            }
            
        }
    
        if country != nil && person != nil {
            formOfYouLabel.text = determine.formOfYou(country: country, person: person, tertiaryDatum: tertiaryDatum)
            formOfYouLabel.isHidden = false
        }
    
    }
    
    func maintainNewTertiaryElements(currentVC: ViewController, nextVC: ViewController) {
        
        do {
            
            // this can probably be reduced
            
            nextVC.tertiaryButtonsView = try currentVC.tertiaryButtonsView?.copyObject()
            nextVC.tertiaryDropdown = try currentVC.tertiaryDropdown?.copyObject()
            
            for button in nextVC.tertiaryButtonsView!.subviews {
                button.removeFromSuperview()
            }
            
            for case let button as UIButton in currentVC.tertiaryButtonsView!.subviews {
                let newButton = try button.copyObject() as! UIButton
                newButton.addTarget(self, action: #selector(activateTertiaryDropdown), for: .touchUpInside)
                nextVC.tertiaryButtonsView?.addSubview(newButton)
            }
            
            for button in nextVC.tertiaryDropdown!.subviews {
                button.removeFromSuperview()
            }
            
            for case let button as UIButton in currentVC.tertiaryDropdown!.subviews {
                let newButton = try button.copyObject() as! UIButton
                newButton.addTarget(self, action: #selector(tertiaryButtonClicked(sender:)), for: .touchUpInside)
                newButton.titleLabel?.numberOfLines = 2
                newButton.titleLabel?.textAlignment = .center
                nextVC.tertiaryDropdown?.addSubview(newButton)
            }
            
        } catch {
            print(error)
        }
        
        nextVC.view.addSubview(nextVC.tertiaryButtonsView!)
        nextVC.view.addSubview(nextVC.tertiaryDropdown!)
        
    }
    
    func setCurrentLanguage() {
        
        if englishButton.currentTitleColor == UIColor.white {
            language = "English"
        } else if spanishButton.currentTitleColor == UIColor.white {
            language = "Espanol"
        }
        
    }
    
    func matchOptionsArrayToCountry(country: String, countryArray: [String], superArray: [[String]]) -> [String] {
        
        // something like this goes on in Determine, 2nd func
        // this function name could probably be better
        
        let countryIndex = countryArray.firstIndex(of: country)!
        let optionsArray = superArray[countryIndex]
        
        return optionsArray
        
    }
    
    func getQuestion3s(country: String?, currentQuestionArray: [String], nextQuestionArray: [String]) -> [String] {
        
        var currentQuestion3: String?
        var nextQuestion3: String?
        var resultsArray = [String]()
        
        if country == "El Salvador" {
            currentQuestion3 = currentQuestionArray[3]
            nextQuestion3 = nextQuestionArray[3]
        } else if country == "Guatemala" {
            currentQuestion3 = currentQuestionArray[4]
            nextQuestion3 = nextQuestionArray[4]
        } else if country == nil {
            currentQuestion3 = nil
            nextQuestion3 = nil
        } else {
            currentQuestion3 = currentQuestionArray[2]
            nextQuestion3 = nextQuestionArray[2]
        }
        
        resultsArray.append(currentQuestion3!)
        resultsArray.append(nextQuestion3!)
        
        return resultsArray
        
    }
    
}

