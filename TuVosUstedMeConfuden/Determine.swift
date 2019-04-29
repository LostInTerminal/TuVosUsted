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
        
        // the function needs to be refactored to account for spanish
        // maybe pass in or find the countries, people, and tertiary arrays
        
        if country == "Argentina" || country == "Paraguay" {
            return "Vos"
        } else if country == "Uruguay" {
            if tertiaryDatum == "Rocha, Rivera, or areas bordering Brazil" {
                return "Tu"
            } else {
                return "Vos"
            }
        } else if country == "Spain" || country == "Equatorial Guinea" || country == "Dominican Republic" || country == "Panama" {
            return "Tú"
        } else if country == "Peru" {
            if tertiaryDatum == "Andean regions or Cajamarca" {
                return "Vos"
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Mexico" {
            if tertiaryDatum == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" {
                return "Vos"
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Chile" || country == "Bolivia" {
            if person == "Colleague in a formal setting" || person == "An elder" {
                return "Tú"
            } else {
                return "Vos"
            }
        } else if country == "Colombia" {
            if tertiaryDatum == "Caribbean coast" {
                return "Tú"
            } else if tertiaryDatum == "Quindío, Risaldo, Antioquia, or Risaralda States" || tertiaryDatum == "Pacific coast" {
                return "Vos"
            } else {
                return "Usted"
            }
        } else if country == "Ecuador" {
            if tertiaryDatum == "North and Central Mountainous Regions" {
                return "Vos"
            } else {
                return "Tu"
            }
        } else if country == "Nicaragua" || country == "Costa Rica" {
            if person == "Colleague in a formal setting" || person == "An elder" {
                return "Usted"
            } else {
                return "Vos"
            }
        } else if country == "Guatemala" {
            if person == "Colleague in a formal setting" || person == "An elder" {
                if tertiaryDatum == "Between Men" {
                    return "Usted"
                } else {
                    return "Tu"
                }
            } else {
                return "Vos"
            }
        } else if country == "El Salvador" {
            if person == "Colleague in a formal setting" || person == "An elder" {
                return "Usted"
            } else {
                if tertiaryDatum == "Semi-formal" {
                    return "Tú"
                } else if tertiaryDatum == "Informal" {
                    return "Vos"
                }
            }
        } else if country == "Cuba" {
            if person == "An elder" {
                return "Vos"
            } else {
                if tertiaryDatum == "Mountainous region or countryside" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Puerto Rico" {
            if person == "Colleague in a formal setting" || person == "An elder" {
                return "Usted"
            } else {
                if tertiaryDatum == "Eastern end of island" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Venezuela" {
            if tertiaryDatum == "Zalia State" {
                return "Vos"
            } else {
                return "Tu"
            }
        }
        return ""
        
    }
    
    func ifAdditionalTextFieldIsNeeded(language: String, country: String) -> [String] {
        
        let tertiary = Tertiary()
        let questions = Questions()
        
        var countryIndex = Array<String>.Index()
        var questionArray = [String]()
        let question: String!
        var optionsSuperarray = [[String]]()
        // i dont even use the following, i think i should delete it
        let optionsArray: [String]!
        let position: String!
        var resultArray = [String]()
        
        if language == "English" {
            countryIndex = tertiary.countriesInEnglish.firstIndex(of: country)!
            questionArray = questions.inEnglish
            optionsSuperarray = tertiary.optionsArrayInEnglish
        } else if language == "Espanol" {
            countryIndex = tertiary.countriesInSpanish.firstIndex(of: country)!
            questionArray = questions.inSpanish
            optionsSuperarray = tertiary.optionsArrayInSpanish
        }
        
        optionsArray = optionsSuperarray[countryIndex]
        
        if country == "El Salvador" {
            question = questionArray[3]
            position = "3"
        } else if country == "Guatemala" {
            question = questionArray[4]
            position = "3"
        } else {
            question = questionArray[2]
            position = "2"

        }
        
        resultArray.append(question)
        resultArray += optionsArray
        resultArray.append(position)
        
        return resultArray
        
    }
    
    func ifAdditionalTextFieldIsNotNeeded(vc: ViewController, language: String, country: String) {
        
        let tertiary = Tertiary()
        
        if language == "English" {
            
            if !tertiary.countriesInEnglish.contains(vc.country!) {
                
                let translation = CGAffineTransform(translationX: vc.view.frame.width * 2, y: 0)
                vc.tertiaryButtonsView?.transform = translation
                
                vc.tertiaryButtonsView?.removeFromSuperview()
                vc.tertiaryDropdown?.removeFromSuperview()
                
            }
            
        } else if language == "Espanol" {
            
            if !tertiary.countriesInSpanish.contains(vc.country!) {
                
                let translation = CGAffineTransform(translationX: -vc.view.frame.width * 2, y: 0)
                vc.tertiaryButtonsView?.transform = translation
                
                vc.tertiaryButtonsView?.removeFromSuperview()
                vc.tertiaryDropdown?.removeFromSuperview()
                
            }
            
        }
        
    }
    
}
