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
    
    let determine = Determine()
    var country: String!
    var person: String!
    var region: String?
    var additionalInfo: String?
    
    let countriesInEnglish = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Equatorial Guinea", "Guatemala", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Puerto Rico", "Spain", "Uruguay", "Venezuela"]
    let peopleInEnglish = ["Family Member/Significant Other", "Friend", "Someone your age or older", "Colleague in a formal setting", "An elder"]
    let countriesEnEspanol = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Ecuador", "El Salvador", "Equatorial Guinea", "España", "Guatemala", "Honduras", "México", "Nicaragua", "Panamá", "Paraguay", "Perú", "Puerto Rico", "República Dominicana", "Uruguay", "Venezuela"]
    let peopleEnEspanol = ["Pariente/Pareja", "Amigo", "Alguien tu edad o mas joven", "Colega en una ambiente formal", "Un anciano"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesTextButton.titleLabel?.numberOfLines = 2
        peopleTextButton.titleLabel?.numberOfLines = 2
        
        addButtonTargets()
    }
    
    func addButtonTargets() {
        
        countriesTextButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        countriesArrowButton.addTarget(self, action: #selector(activateCountriesDropdown), for: .touchUpInside)
        peopleTextButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        peopleArrowButton.addTarget(self, action: #selector(activatePeopleDropdown), for: .touchUpInside)
        
    }
    
    @objc func countryClicked(sender: UIButton) {
        
        countriesDropdown.isHidden = true
        peopleButtonsView.isHidden = false
        
        country = sender.titleLabel?.text
        countriesTextButton.setTitle(country, for: .normal)
        
        if country != nil && person != nil {
            formOfYouLabel.text = determine.formOfYou(country: country, person: person, region: region, additionalInfo: additionalInfo)
            formOfYouLabel.isHidden = false
            var regionsArray = determine.ifRegionTextFieldIsNeeded(country: country)
            if regionsArray != [] {
                let sectionTitle = regionsArray?[0]
                regionsArray?.remove(at: 0)
                let newElementsPosition = Int((regionsArray?.popLast())!)
                let buttonTitles = regionsArray //remove first index
                createFlyInStackView(sectionTitle: sectionTitle!, buttonTitles: buttonTitles!, newElementsPosition: newElementsPosition!)
            }
            var newElementsArray = determine.ifRegionTextFieldIsNeeded(country: country)
            if newElementsArray != [] {
                let sectionTitle = newElementsArray?[0]
                newElementsArray?.remove(at: 0)
                let newElementsPosition = Int((newElementsArray?.popLast())!)
                let buttonTitles = newElementsArray //remove first index
                createFlyInStackView(sectionTitle: sectionTitle!, buttonTitles: buttonTitles!, newElementsPosition: newElementsPosition!)
            }
        }
        
    }
    
    @objc func personClicked(sender: UIButton) {
        
        peopleDropdown.isHidden = true
        
        person = sender.titleLabel?.text
        peopleTextButton.setTitle(person, for: .normal)
        
        if country != nil && person != nil {
            formOfYouLabel.text = determine.formOfYou(country: country, person: person, region: region, additionalInfo: additionalInfo)
            formOfYouLabel.isHidden = false
            determine.ifAdditionalInfoTextFieldIsNeeded(country: country)
            var newElementsArray = determine.ifRegionTextFieldIsNeeded(country: country)
            if newElementsArray != [] {
                let sectionTitle = newElementsArray?[0]
                newElementsArray?.remove(at: 0)
                let newElementsPosition = Int((newElementsArray?.popLast())!)
                let buttonTitles = newElementsArray //remove first index
                createFlyInStackView(sectionTitle: sectionTitle!, buttonTitles: buttonTitles!, newElementsPosition: newElementsPosition!)
            }
        }
        
    }
    
    @objc func activateCountriesDropdown() {
        
        countriesDropdown.isHidden = !countriesDropdown.isHidden
        peopleButtonsView.isHidden = !peopleButtonsView.isHidden
        
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
    
    func createFlyInStackView(sectionTitle: String, buttonTitles: [String], newElementsPosition: Int) {
        
        var currentButtonTitlesIndex = 0
        
        let sectionView = UIView()
        let sectionTitleButton = UIButton()
        let sectionPictureButton = UIButton()
        sectionPictureButton.setImage(UIImage(named: "arrow"), for: .normal)
        sectionTitleButton.titleLabel?.text = sectionTitle
        sectionView.addSubview(sectionTitleButton)
        sectionView.addSubview(sectionPictureButton)
        
        let stackView = UIStackView()
        while currentButtonTitlesIndex < buttonTitles.count {
            let thirdSectionButton = UIButton()
            thirdSectionButton.frame.size = CGSize(width: 250, height: 50)
            thirdSectionButton.titleLabel?.text = buttonTitles[currentButtonTitlesIndex]
            stackView.addSubview(thirdSectionButton)
            currentButtonTitlesIndex += 1
        }
        
        if newElementsPosition == 2 {
            
            // moving already existing stuff at 2
            peopleTextButton.centerYAnchor.constraint(equalTo: peopleTextButton.centerYAnchor, constant: 208.5)
            
            // adding
            sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 0)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: -208.5)
            
        } else if newElementsPosition == 3 {
            
            sectionView.widthAnchor.constraint(equalTo: peopleTextButton.widthAnchor, constant: 0)
            sectionView.heightAnchor.constraint(equalTo: peopleTextButton.heightAnchor, constant: 0)
            sectionView.centerXAnchor.constraint(equalTo: peopleTextButton.centerXAnchor, constant: 208.5)
            sectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
            stackView.widthAnchor.constraint(equalTo: peopleDropdown.widthAnchor, constant: 0)
            stackView.heightAnchor.constraint(equalTo: peopleDropdown.heightAnchor, constant: 0)
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            stackView.centerYAnchor.constraint(equalTo: peopleDropdown.centerYAnchor, constant: 208.5)
            
        }
        
        view.addSubview(sectionView)
        view.addSubview(stackView)
        
    }
    
    @IBAction func englishButtonSelected(_ sender: UIButton) {
        
        if englishButton.titleLabel?.textColor == UIColor.black {
            
            englishButton.setTitleColor(UIColor.white, for: .normal)
            spanishButton.setTitleColor(UIColor.black, for: .normal)
            
            countriesTextButton.titleLabel?.font = UIFont(name: "Meteoritox", size: 22)
            countriesTextButton.setTitle("What country are you in", for: .normal)
            var country = 0
            while country < 18 {
                country += 1
                for horizontalView in countriesDropdown.subviews {
                    for case let label as UILabel in horizontalView.subviews {
                        label.text = countriesInEnglish[country]
                        country += 1
                        label.text = countriesInEnglish[country]
                    }
                }
                
            }
            
            peopleTextButton.titleLabel?.font = UIFont(name: "Meteoritox", size: 22)
            peopleTextButton.setTitle("Who are you talking to", for: .normal)
            var person = 0
            while person < 5 {
                for horizontalView in peopleDropdown.subviews {
                    for case let label as UILabel in horizontalView.subviews {
                        label.text = peopleInEnglish[person]
                        person += 1
                    }
                }
            }
            
        }
        
    }
    
    @IBAction func spanishButtonSelected(_ sender: UIButton) {
        
        if spanishButton.titleLabel?.textColor == UIColor.black {
            
            spanishButton.setTitleColor(UIColor.white, for: .normal)
            englishButton.setTitleColor(UIColor.black, for: .normal)
            
            countriesTextButton.titleLabel?.font = UIFont(name: "Meteoritox", size: 17)
            countriesTextButton.setTitle("En que país estás/estáis/está", for: .normal)
            var country = 0
            while country < 18 {
                country += 1
                for horizontalView in countriesDropdown.subviews {
                    for case let label as UILabel in horizontalView.subviews {
                        label.text = countriesEnEspanol[country]
                        country += 1
                        label.text = countriesEnEspanol[country]
                    }
                }
                
            }
            
            peopleTextButton.titleLabel?.font = UIFont(name: "Meteoritox", size: 17)
            peopleTextButton.setTitle("Con quien hablas/habláis/habla", for: .normal)
            var person = 0
            while person < 5 {
                for horizontalView in peopleDropdown.subviews {
                    for case let label as UILabel in horizontalView.subviews {
                        label.text = peopleEnEspanol[person]
                        person += 1
                    }
                }
            }
            
        }
        
    }
    
}

