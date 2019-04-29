//
//  TertiaryQuestionData.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/27/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

struct Tertiary {
    
    var optionsArrayInEnglish = [[String]]()
    var optionsArrayInSpanish = [[String]]()
    var superarray = [[[String]]]()
    
    // ENGLISH
    
    let countriesInEnglish = ["Colombia", "Cuba", "Ecuador", "El Salvador", "Guatemala", "Mexico", "Peru", "Puerto Rico", "Uruguay", "Venezuela"]
    
    let colombiaOptionsInEnglish = ["Caribbean coast", "Quindío, Risaldo, Antioquia, or Risaralda States", "Pacific coast", "Anywhere Else"]
    let cubaOptionsInEnglish = ["Mountainous region or countryside", "Anywhere else"]
    let ecuadorOptionsInEnglish = ["North and Central Mountainous Regions", "Anywhere else"]
    let elSalvadorOptionsInEnglish = ["Semi-formal", "Informal"]
    let guatemalaOptionsInEnglish = ["Yes", "No"]
    let mexicoOptionsInEnglish = ["Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo", "Anywhere else"]
    let peruOptionsInEnglish = ["Andean regions or Cajamarca", "Anywhere else", "2"]
    let puertoRicoOptionsInEnglish = ["Eastern end of island", "Anywhere else"]
    let uruguayOptionsInEnglish = ["Rocha, Rivera, or areas bordering Brazil", "Anywhere else"]
    let venezuelaOptionsInEnglish = ["Zalia State", "Anywhere else"]
    
    // SPANISH
    
    let countriesInSpanish = ["Colombia", "Cuba", "Ecuador", "El Salvador", "Guatemala", "México", "Perú", "Puerto Rico", "Uruguay", "Venezuela"]
    
    let colombiaOptionsInSpanish = ["Costa caribeña", "Costa pacifica", "Estados de Quindío, Risaldo, Antioquia, o Risaralda", "Cualquier otro lugar"]
    let cubaOptionsInSpanish = ["Regiones montañosas o el campo", "Cualquier otro lugar"]
    let ecuadorOptionsInSpanish = ["Regiones montañosas del norte y centro", "Cualquier otro lugar"]
    let elSalvadorOptionsInSpanish = ["Semi-formal", "Informal"]
    let guatemalaOptionsInSpanish = ["Sí", "No"]
    let mexicoOptionsInSpanish = ["Pueblos indígenas en Chiapas, Tabasco, Yucatán o Quintana Roo", "Cualquier otro lugar"]
    let peruOptionsInSpanish = ["Regiones andinas o cajamarca", "Cualquier otro lugar"]
    let puertoRicoOptionsInSpanish = ["Extremo oriental de la isla", "Cualquier otro lugar"]
    let uruguayOptionsInSpanish = ["Rocha, Rivera, o zonas limítrofes con Brasil", "Cualquier otro lugar"]
    let venezuelaOptionsInSpanish = ["Estado Zalia", "Cualquier otro lugar"]
    
    init() {
        
        optionsArrayInEnglish.append(colombiaOptionsInEnglish)
        optionsArrayInEnglish.append(cubaOptionsInEnglish)
        optionsArrayInEnglish.append(ecuadorOptionsInEnglish)
        optionsArrayInEnglish.append(elSalvadorOptionsInEnglish)
        optionsArrayInEnglish.append(guatemalaOptionsInEnglish)
        optionsArrayInEnglish.append(mexicoOptionsInEnglish)
        optionsArrayInEnglish.append(peruOptionsInEnglish)
        optionsArrayInEnglish.append(puertoRicoOptionsInEnglish)
        optionsArrayInEnglish.append(uruguayOptionsInEnglish)
        optionsArrayInEnglish.append(venezuelaOptionsInEnglish)
        
        optionsArrayInSpanish.append(colombiaOptionsInSpanish)
        optionsArrayInSpanish.append(cubaOptionsInSpanish)
        optionsArrayInSpanish.append(ecuadorOptionsInSpanish)
        optionsArrayInSpanish.append(elSalvadorOptionsInSpanish)
        optionsArrayInSpanish.append(guatemalaOptionsInSpanish)
        optionsArrayInSpanish.append(mexicoOptionsInSpanish)
        optionsArrayInSpanish.append(peruOptionsInSpanish)
        optionsArrayInSpanish.append(puertoRicoOptionsInSpanish)
        optionsArrayInSpanish.append(uruguayOptionsInSpanish)
        optionsArrayInSpanish.append(venezuelaOptionsInSpanish)
        
        superarray.append(optionsArrayInSpanish)
        superarray.append(optionsArrayInSpanish)
        
    }
    
}
