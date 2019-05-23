//
//  Determine.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 3/1/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Determine {
    
    func formOfYou(country: String, person: String, tertiaryDatum: String?) -> String {
        
        if country == "Argentina" || country == "Paraguay" {
            return "Vos "
        } else if country == "Uruguay" {
            if tertiaryDatum == "Rocha, Rivera, or areas bordering Brazil" || tertiaryDatum == "Rocha, Rivera, o zonas limítrofes con Brasil" {
                return "Tú "
            } else {
                return "Vos "
            }
        } else if country == "Spain" || country == "España" || country == "Equatorial Guinea" || country == "Guinea Equatorial" || country == "Dominican Republic" || country == "República Dominicana" || country == "Panama" || country == "Panamá" {
            return "Tú "
        } else if country == "Peru" || country == "Perú" {
            if tertiaryDatum == "Andean regions or Cajamarca" || tertiaryDatum == "Regiones andinas o cajamarca" {
                return "Vos "
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                    return "Usted "
                } else {
                    return "Tú "
                }
            }
        } else if country == "Mexico" || country == "México" || country == "United States" || country == "Estados Unidos" {
            if tertiaryDatum == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" || tertiaryDatum == "Pueblos indígenas en Chiapas, Tabasco, Yucatán o Quintana Roo" {
                return "Vos "
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                    return "Usted "
                } else {
                    return "Tú "
                }
            }
        } else if country == "Chile" || country == "Bolivia" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Tú "
            } else {
                return "Vos "
            }
        } else if country == "Colombia" {
            if tertiaryDatum == "Caribbean coast" || tertiaryDatum == "Costa caribeña" {
                return "Tú "
            } else if tertiaryDatum == "Quindío, Risaldo, Antioquia, or Risaralda States" || tertiaryDatum == "Pacific coast" || tertiaryDatum == "Estados de Quindío, Risaldo, Antioquia, o Risaralda" || tertiaryDatum == "Costa pacifica" {
                return "Vos "
            } else {
                return "Usted "
            }
        } else if country == "Ecuador" {
            if tertiaryDatum == "North and Central Mountainous Regions" || tertiaryDatum == "Regiones montañosas del norte y centro" {
                return "Vos "
            } else {
                return "Tú "
            }
        } else if country == "Nicaragua" || country == "Costa Rica" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted "
            } else {
                return "Vos "
            }
        } else if country == "Guatemala" || country == "Honduras" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                if tertiaryDatum == "Yes" || tertiaryDatum == "Sí" {
                    return "Usted "
                } else {
                    return "Tu "
                }
            } else {
                return "Vos "
            }
        } else if country == "El Salvador" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted "
            } else {
                if tertiaryDatum == "Yes" || tertiaryDatum == "Sí" {
                    return "Vos "
                } else {
                    return "Tú "
                }
            }
        } else if country == "Cuba" {
            if person == "An elder" || person == "Un anciano" {
                return "Vos "
            } else {
                if tertiaryDatum == "Mountainous region or countryside" || tertiaryDatum == "Regiones montañosas o el campo" {
                    return "Vos "
                } else {
                    return "Tú "
                }
            }
        } else if country == "Puerto Rico" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted"
            } else {
                if tertiaryDatum == "Eastern end of island" {
                    return "Vos "
                } else {
                    return "Tú "
                }
            }
        } else if country == "Venezuela" {
            if tertiaryDatum == "Zalia State" || tertiaryDatum == "Estado Zalia" {
                return "Vos "
            } else {
                return "Tú "
            }
        }
        return ""
        
    }
    
    func obtainTertiaryData(language: String, country: String) -> [String] {
        
        let tertiary = Tertiary()
        let questions = Questions()
        
        var countryIndex = Array<String>.Index()
        var questionArray = [String]()
        let question: String!
        var optionsSuperarray = [[String]]()
        let optionsArray: [String]!
        let position: String!
        var resultArray = [String]()
        
        if language == "English" && tertiary.countriesInEnglish.contains(country) {
            countryIndex = tertiary.countriesInEnglish.firstIndex(of: country)!
            questionArray = questions.inEnglish
            optionsSuperarray = tertiary.optionsArrayInEnglish
        } else if language == "Español" &&  tertiary.countriesInSpanish.contains(country) {
            countryIndex = tertiary.countriesInSpanish.firstIndex(of: country)!
            questionArray = questions.inSpanish
            optionsSuperarray = tertiary.optionsArrayInSpanish
        }
        
        if optionsSuperarray != [] {
            optionsArray = optionsSuperarray[countryIndex]
            
            if country == "El Salvador" {
                question = questionArray[3]
                position = "3"
            } else if country == "Guatemala" || country == "Honduras" {
                question = questionArray[4]
                position = "3"
            } else {
                question = questionArray[2]
                position = "2"
                
            }
            
            resultArray.append(question)
            resultArray += optionsArray
            resultArray.append(position)
        }
        
        return resultArray
        
    }
    
    func ifAdditionalTextFieldIsNotNeeded(vc: ViewController, language: String, country: String) {
        
        let tertiary = Tertiary()
        let translation = Style.Ratios.twoTimesScreenWidth
        
        for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .horizontal) {
            if constraint.constant == 0 {
                if language == "English" && !tertiary.countriesInEnglish.contains(vc.country!) {
                    constraint.constant += translation
                } else if language == "Español" && !tertiary.countriesInSpanish.contains(vc.country!) {
                    constraint.constant -= translation
                } else { return }
            }
        }
        
        UserDefaults.standard.set(false, forKey: "tertiaryItemsAreOnScreen")
        print("look")
        print(UserDefaults.standard.bool(forKey: "tertiaryItemsAreOnScreen"))
        
        UIView.animate(withDuration: 0.5, animations: {
            vc.view.layoutIfNeeded()
        }, completion: { (Bool) in
            vc.tertiaryTextButton = nil
            vc.tertiaryDropdown = nil
        })
        
    }
    
    func ifDropdownOptionsShouldBeChanged(language: String, country: String, tertiaryDatum: String) -> Bool {
        
        let tertiary = Tertiary()
        var dropdownOptionsShouldBeChanged = false
        
        if language == "English" && tertiary.countriesInEnglish.contains(country) {
            let countryArrayIndex = tertiary.countriesInEnglish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            if !countryArray.contains(tertiaryDatum) {
                dropdownOptionsShouldBeChanged = true
            }
        } else if language == "Español" && tertiary.countriesInSpanish.contains(country) {
            let countryArrayIndex = tertiary.countriesInSpanish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            if !countryArray.contains(tertiaryDatum) {
                dropdownOptionsShouldBeChanged = true
            }
        }
        
        return dropdownOptionsShouldBeChanged
        
    }
    
    func ifTertiaryQuestionMatchesValue(language: String, country: String) -> String {
        
        var question: String!
        let questions = Questions()
        var questionArray = [String]()
        
        if language == "English" {
            questionArray = questions.inEnglish
        } else if language == "Español" {
            questionArray = questions.inSpanish
        }
        
        if country == "El Salvador" {
            question = questionArray[3]
        } else if country == "Guatemala" || country == "Honduras" {
            question = questionArray[4]
        } else {
            question = questionArray[2]
            
        }
        
        return question
        
    }
}
