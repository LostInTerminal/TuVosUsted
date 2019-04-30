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
            return "Vos"
        } else if country == "Uruguay" {
            if tertiaryDatum == "Rocha, Rivera, or areas bordering Brazil" || tertiaryDatum == "Rocha, Rivera, o zonas limítrofes con Brasil" {
                return "Tu"
            } else {
                return "Vos"
            }
        } else if country == "Spain" || country == "Equatorial Guinea" || country == "Dominican Republic" || country == "Panama" {
            return "Tú"
        } else if country == "Peru" {
            if tertiaryDatum == "Andean regions or Cajamarca" || tertiaryDatum == "Regiones andinas o cajamarca" {
                return "Vos"
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Mexico" {
            if tertiaryDatum == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" || tertiaryDatum == "Pueblos indígenas en Chiapas, Tabasco, Yucatán o Quintana Roo" {
                return "Vos"
            } else {
                if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Chile" || country == "Bolivia" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Tú"
            } else {
                return "Vos"
            }
        } else if country == "Colombia" {
            if tertiaryDatum == "Caribbean coast" || tertiaryDatum == "Costa caribeña" {
                return "Tú"
            } else if tertiaryDatum == "Quindío, Risaldo, Antioquia, or Risaralda States" || tertiaryDatum == "Pacific coast" || tertiaryDatum == "Estados de Quindío, Risaldo, Antioquia, o Risaralda" || tertiaryDatum == "Costa pacifica" {
                return "Vos"
            } else {
                return "Usted"
            }
        } else if country == "Ecuador" {
            if tertiaryDatum == "North and Central Mountainous Regions" || tertiaryDatum == "Regiones montañosas del norte y centro" {
                return "Vos"
            } else {
                return "Tu"
            }
        } else if country == "Nicaragua" || country == "Costa Rica" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted"
            } else {
                return "Vos"
            }
        } else if country == "Guatemala" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                if tertiaryDatum == "Yes" || tertiaryDatum == "Sí" {
                    return "Usted"
                } else {
                    return "Tu"
                }
            } else {
                return "Vos"
            }
        } else if country == "El Salvador" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted"
            } else {
                if tertiaryDatum == "Semi-formal" {
                    return "Tú"
                } else if tertiaryDatum == "Informal" {
                    return "Vos"
                }
            }
        } else if country == "Cuba" {
            if person == "An elder" || person == "Un anciano" {
                return "Vos"
            } else {
                if tertiaryDatum == "Mountainous region or countryside" || tertiaryDatum == "Regiones montañosas o el campo" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Puerto Rico" {
            if person == "Colleague in a formal setting" || person == "An elder" || person == "Colega en una ambiente formal" || person == "Un anciano" {
                return "Usted"
            } else {
                if tertiaryDatum == "Eastern end of island" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Venezuela" {
            if tertiaryDatum == "Zalia State" || tertiaryDatum == "Estado Zalia" {
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
        let optionsArray: [String]!
        let position: String!
        var resultArray = [String]()
        
        if language == "English" && tertiary.countriesInEnglish.contains(country) {
            countryIndex = tertiary.countriesInEnglish.firstIndex(of: country)!
            questionArray = questions.inEnglish
            optionsSuperarray = tertiary.optionsArrayInEnglish
        } else if language == "Espanol" &&  tertiary.countriesInSpanish.contains(country) {
            countryIndex = tertiary.countriesInSpanish.firstIndex(of: country)!
            questionArray = questions.inSpanish
            optionsSuperarray = tertiary.optionsArrayInSpanish
        }
        
        if optionsSuperarray != [] {
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
        }
        
        return resultArray
        
    }
    
    func ifAdditionalTextFieldIsNotNeeded(vc: ViewController, language: String, country: String) {
        
        let tertiary = Tertiary()
        
        if language == "English" {
            
            if !tertiary.countriesInEnglish.contains(vc.country!) {
                
                UIView.animate(withDuration: 0.5, animations: {
                    let translation = CGAffineTransform(translationX: vc.view.frame.width * 2, y: 0)
                    vc.tertiaryButtonsView?.transform = translation
                }, completion: { (Bool) in
                    vc.tertiaryButtonsView = nil
                    vc.tertiaryTextButton = nil
                    vc.tertiaryDropdown = nil
                })
                
                
            }
            
        } else if language == "Espanol" {
            
            if !tertiary.countriesInSpanish.contains(vc.country!) {
                
                UIView.animate(withDuration: 0.5, animations: {
                    let translation = CGAffineTransform(translationX: -vc.view.frame.width * 2, y: 0)
                    vc.tertiaryButtonsView?.transform = translation
                }, completion: { (Bool) in
                    vc.tertiaryButtonsView = nil
                    vc.tertiaryTextButton = nil
                    vc.tertiaryDropdown = nil
                    //vc.tertiaryButtonsView?.removeFromSuperview()
                    //vc.tertiaryDropdown?.removeFromSuperview()
                })
                
            }
            
        }
        
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
        } else if language == "Espanol" && tertiary.countriesInSpanish.contains(country) {
            let countryArrayIndex = tertiary.countriesInSpanish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            if !countryArray.contains(tertiaryDatum) {
                dropdownOptionsShouldBeChanged = true
            }
        }
        
        return dropdownOptionsShouldBeChanged
        
    }
    
}

/*
 if country == "Argentina" || country == "Paraguay" {
 
 formOfYou = "Vos"
 
 } else if country == "Uruguay" {
 
 tertiary.superarray.forEach { (optionsArray) in
 if tertiaryDatum == optionsArray[9][0] {
 formOfYou = "Tú"
 }
 }
 
 formOfYou = "Vos"
 
 } else if country == "Spain" || country == "Equatorial Guinea" || country == "Dominican Republic" || country == "Panama" {
 
 formOfYou = "Tú"
 
 } else if country == "Peru" {
 tertiary.superarray.forEach { (optionsArray) in
 if tertiaryDatum == optionsArray[7][0] || tertiaryDatum == optionsArray[7][0] {
 formOfYou = "Vos"
 }
 }
 
 if formOfYou != "Vos" {
 people.superarray.forEach { (peopleArray) in
 if tertiaryDatum == peopleArray[3] || tertiaryDatum == peopleArray[4] {
 formOfYou = "Usted"
 } else {
 formOfYou = "Tú"
 }
 }
 }
 }
 */
