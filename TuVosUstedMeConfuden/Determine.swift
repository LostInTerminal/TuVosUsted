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
    
    func ifRegionTextFieldIsNeeded(country: String) -> [String]? {
        
        if country == "Colombia" {
            return ["What region will you be visiting", "Caribbean coast", "Quindío, Risaldo, Antioquia, or Risaralda States", "Pacific coast", "Anywhere Else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Caribbean coast", "Quindío, Risaldo, Antioquia, or Risaralda States", "Pacific coast", "Anywhere Else"])
        } else if country == "Cuba" {
            return ["What region will you be visiting", "Mountainous region or countryside", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Mountainous region or countryside", "Anywhere else"])
        } else if country == "Ecuador" {
            return ["What region will you be visiting", "North and Central Mountainous Regions", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["North and Central Mountainous Regions", "Anywhere else"])
        } else if country == "Mexico" {
            return ["What region will you be visiting", "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo", "Anywhere else"])
        } else if country == "Peru" {
            return ["What region will you be visiting", "Andean regions or Cajamarca", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Andean regions or Cajamarca", "Anywhere else"])
        } else if country == "Puerto Rico" {
            return ["What region will you be visiting", "Eastern end of island", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Eastern end of island", "Anywhere else"])
        } else if country == "Uruguay" {
            return ["What region will you be visiting", "Rocha, Rivera, or areas bordering Brazil", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Rocha, Rivera, or areas bordering Brazil", "Anywhere else"])
        } else if country == "Venezuela" {
            return ["What region will you be visiting", "Zalia State", "Anywhere else", "2"]
            //createFlyInStackView(sectionTitle: "What region will you be visiting", buttonTitles: ["Zalia State", "Anywhere else"])
        }
        return []
    }
    
    func ifAdditionalInfoTextFieldIsNeeded(country: String) -> [String] {
        if country == "El Salvador" {
            return ["Which of the following best describes the situation", "Semi-Formal", "Informal", "3"]
            //createFlyInStackView(sectionTitle: "Which of the following best describes the situation", buttonTitles: ["Semi-Formal", "Informal"])
        } else if country == "Guatemala" {
            return ["Is the conversation between two men", "Yes", "No", "3"]
            //createFlyInStackView(sectionTitle: "Is the conversation between two men", buttonTitles: ["Yes", "No"])
        }
        return []
    }
    
}
