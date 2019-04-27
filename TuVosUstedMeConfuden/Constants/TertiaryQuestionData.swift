//
//  TertiaryQuestionData.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/27/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

struct TertiaryQuestionData {
    
    var englishOptionsArray = [[String]]()
    var ordenOpcionesEnEspanol = [[String]]()
    
    // ENGLISH
    
    let countriesWithTertiaryOptions = ["Colombia", "Cuba", "Ecuador", "El Salvador", "Guatemala", "Mexico", "Peru", "Puerto Rico", "Uruguay", "Venezuela"]
    
    let colombiaOptions = ["Caribbean coast", "Quindío, Risaldo, Antioquia, or Risaralda States", "Pacific coast", "Anywhere Else"]
    let cubaOptions = ["Mountainous region or countryside", "Anywhere else"]
    let ecuadorOptions = ["What region will you be visiting", "North and Central Mountainous Regions", "Anywhere else"]
    let mexicoOptions = ["What region will you be visiting", "Indigenous villages in Chiapas, Tabasco, Yucatán, or Quintana Roo", "Anywhere else"]
    let peruOptions = ["What region will you be visiting", "Andean regions or Cajamarca", "Anywhere else", "2"]
    let puertoRicoOptions = ["Eastern end of island", "Anywhere else"]
    let uruguayOptions = ["Rocha, Rivera, or areas bordering Brazil", "Anywhere else"]
    let venezuelaOptions = ["Zalia State", "Anywhere else"]
    
    let elSalvadorOptions = ["Semi-Formal", "Informal"]
    let guatemalaOptions = ["Yes", "No"]
    
    // SPANISH
    
    let paisesConOpcionesTerciarias = ["Colombia", "Cuba", "Ecuador", "El Salvador", "Guatemala", "México", "Perú", "Puerto Rico", "Uruguay", "Venezuela"]
    
    let opcionesColombianas = ["Costa caribeña", "Costa pacifica", "Estados de Quindío, Risaldo, Antioquia, o Risaralda", "Cualquier otro lugar"]
    let opcionesCubanas = ["Regiones montañosas o el campo", "Cualquier otro lugar"]
    let opcionesEcuatorianas = ["Regiones montañosas del norte y centro", "Cualquier otro lugar"]
    let opcionesMexicanas = ["Pueblos indígenas en Chiapas, Tabasco, Yucatán o Quintana Roo", "Cualquier otro lugar"]
    let opcionesPeruanas = ["Regiones andinas o cajamarca", "Cualquier otro lugar"]
    let opcionesPuertorriquenos = ["Extremo oriental de la isla", "Cualquier otro lugar"]
    let opcionesUruguayas = ["Rocha, Rivera, o zonas limítrofes con Brasil", "Cualquier otro lugar"]
    let opcionesVenezolanas = ["Estado Zalia", "Cualquier otro lugar"]
    
    let opcionesSalvadorenas = ["Semi-Formal", "Informal"]
    let opcionesGuatemaltecas = ["Sí", "No"]
    
    init() {
        
        englishOptionsArray.append(colombiaOptions)
        englishOptionsArray.append(cubaOptions)
        englishOptionsArray.append(ecuadorOptions)
        englishOptionsArray.append(elSalvadorOptions)
        englishOptionsArray.append(guatemalaOptions)
        englishOptionsArray.append(mexicoOptions)
        englishOptionsArray.append(peruOptions)
        englishOptionsArray.append(puertoRicoOptions)
        englishOptionsArray.append(uruguayOptions)
        englishOptionsArray.append(venezuelaOptions)
        
        ordenOpcionesEnEspanol.append(opcionesColombianas)
        ordenOpcionesEnEspanol.append(opcionesCubanas)
        ordenOpcionesEnEspanol.append(opcionesEcuatorianas)
        ordenOpcionesEnEspanol.append(opcionesSalvadorenas)
        ordenOpcionesEnEspanol.append(opcionesGuatemaltecas)
        ordenOpcionesEnEspanol.append(opcionesMexicanas)
        ordenOpcionesEnEspanol.append(opcionesPeruanas)
        ordenOpcionesEnEspanol.append(opcionesPuertorriquenos)
        ordenOpcionesEnEspanol.append(opcionesUruguayas)
        ordenOpcionesEnEspanol.append(opcionesVenezolanas)
        
    }
    
}
