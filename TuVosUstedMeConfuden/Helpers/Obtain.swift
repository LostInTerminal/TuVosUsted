//
//  Obtain.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Obtain {
    
    static func formOfYou(country: String, person: String, tertiaryDatum: String?) -> String {
        
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
    
    static func tertiaryData(language: String, country: String) -> [String] {
        
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
    
    static func newTertiaryDropdownValues(vc: ViewController) {
        
        if Determine.ifDropdownOptionsShouldBeChanged(language: UserDefaults.standard.string(forKey: "language")!, country: vc.country, tertiaryDatum: vc.tertiaryDatum ?? "") {
            
            for case let button as UIButton in vc.uiElements.tertiaryDropdown!.subviews {
                button.removeFromSuperview()
            }
            
            var tertiaryArray = Obtain.tertiaryData(language: UserDefaults.standard.string(forKey: "language")!, country: vc.country)
            if tertiaryArray != [] {
                tertiaryArray.remove(at: 0)
                tertiaryArray.popLast()
                let buttonTitles = tertiaryArray
                
                Populate.regularDropdown(vc: vc, buttonTitles: buttonTitles, dropdown: vc.uiElements.tertiaryDropdown!)
                vc.uiElements.tertiaryDropdown!.updateOptionText(peopleDropdown: vc.uiElements.peopleDropdown)
            }
            
        }
        
    }
    
    static func newHeightConstraintFor(textButton: UIButton) {
        
        let size = Style.Size()
        
        let oneLineHeight = " ".heightWithConstrainedWidth(width: size.boxWidth, font: textButton.titleLabel!.font)
        let textHeight = textButton.titleLabel!.text!.heightWithConstrainedWidth(width: size.boxWidth, font: textButton.titleLabel!.font)
        
        var relevantValue: CGFloat = 0
        
        for constraint in textButton.constraintsAffectingLayout(for: .vertical) {
            relevantValue = constraint.constant
            if relevantValue == size.boxHeight || relevantValue == size.boxHeight * 1.6 || relevantValue == size.boxHeight * 2.2 {
                constraint.isActive = false
            }
        }
        
        if textHeight > oneLineHeight * 0.9 && textHeight < oneLineHeight * 1.1 {
            textButton.heightAnchor.constraint(equalToConstant: size.boxHeight).isActive = true
        } else if textHeight > oneLineHeight * 1.9 && textHeight < oneLineHeight * 2.1 {
            textButton.heightAnchor.constraint(equalToConstant: size.boxHeight * 1.6).isActive = true
        } else if textHeight > oneLineHeight * 2.9 && textHeight < oneLineHeight * 3.1 {
            textButton.heightAnchor.constraint(equalToConstant: size.boxHeight * 2.2).isActive = true
        }
        
    }
    
}
