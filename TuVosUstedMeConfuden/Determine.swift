//
//  Determine.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 3/1/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

class Determine {
    
    func formOfYou(country: String, person: String, region: String?, additionalInfo: String?) -> String {
        
        // the function needs to be refactored to account for spanish
        
        if country == "Argentina" || country == "Paraguay" {
            return "Vos"
        } else if country == "Uruguay" {
            if region == "Rocha, Rivera, or areas bordering Brazil" {
                return "Tu"
            } else {
                return "Vos"
            }
        } else if country == "Spain" || country == "Equatorial Guinea" || country == "Dominican Republic" || country == "Panama" {
            return "Tú"
        } else if country == "Peru" {
            if region == "Andean regions or Cajamarca" {
                return "Vos"
            } else {
                if person == "Colleague in a Formal Setting" || person == "An elder" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Mexico" {
            print(person)
            if region == "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo" {
                return "Vos"
            } else {
                if person == "Colleague in a Formal Setting" || person == "An elder" {
                    return "Usted"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Chile" || country == "Bolivia" {
            if person == "Colleague in a Formal Setting" || person == "An elder" {
                return "Tú"
            } else {
                return "Vos"
            }
        } else if country == "Colombia" {
            if region == "Caribbean coast" {
                return "Tú"
            } else if region == "Quindío, Risaldo, Antioquia, or Risaralda States" || region == "Pacific coast" {
                return "Vos"
            } else {
                return "Usted"
            }
        } else if country == "Ecuador" {
            if region == "North and Central Mountainous Regions" {
                return "Vos"
            } else {
                return "Tu"
            }
        } else if country == "Nicaragua" || country == "Costa Rica" {
            if person == "Colleague in a Formal Setting" || person == "An elder" {
                return "Usted"
            } else {
                return "Vos"
            }
        } else if country == "Guatemala" {
            if person == "Colleague in a Formal Setting" || person == "An elder" {
                if additionalInfo == "Between Men" {
                    return "Usted"
                } else {
                    return "Tu"
                }
            } else {
                return "Vos"
            }
        } else if country == "El Salvador" {
            if person == "Colleague in a Formal Setting" || person == "An elder" {
                return "Usted"
            } else {
                if additionalInfo == "Semi-Formal" {
                    return "Tú"
                } else if additionalInfo == "Informal" {
                    return "Vos"
                }
            }
        } else if country == "Cuba" {
            if person == "An elder" {
                return "Vos"
            } else {
                if region == "Mountainous region or countryside" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Puerto Rico" {
            if person == "Colleague in a Formal Setting" || person == "An elder" {
                return "Usted"
            } else {
                if region == "Eastern end of island" {
                    return "Vos"
                } else {
                    return "Tú"
                }
            }
        } else if country == "Venezuela" {
            if region == "Zalia State" {
                return "Vos"
            } else {
                return "Tu"
            }
        }
        return ""
        
    }
    
    func ifAdditionalTextFieldIsNeeded(language: String, country: String) -> [String] {
        
        let constants = Constants()
        let tertiary = TertiaryQuestionData()
        
        var countryIndex = Array<String>.Index()
        var questionArray = [String]()
        let question: String!
        var optionsSuperarray = [[String]]()
        let optionsArray: [String]!
        let position: String!
        var resultArray = [String]()
        
        if language == "English" {
            countryIndex = tertiary.countriesWithTertiaryOptions.firstIndex(of: country)!
            questionArray = constants.questionsInEnglish
            optionsSuperarray = tertiary.englishOptionsArray
        } else if language == "Espanol" {
            countryIndex = tertiary.paisesConOpcionesTerciarias.firstIndex(of: country)!
            questionArray = constants.preguntasEnEspanol
            optionsSuperarray = tertiary.ordenOpcionesEnEspanol
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
    
}
