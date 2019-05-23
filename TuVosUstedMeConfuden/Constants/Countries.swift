//
//  Countries.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

struct Countries {
    
    var superarray = [[String]]()
    
    let inEnglish = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Equatorial Guinea", "Guatemala", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Puerto Rico", "Spain", "United States", "Uruguay", "Venezuela"]
    let inSpanish = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Ecuador", "El Salvador", "España", "Estados Unidos", "Guatemala", "Guinea Equatorial", "Honduras", "México", "Nicaragua", "Panamá", "Paraguay", "Perú", "Puerto Rico", "República Dominicana", "Uruguay", "Venezuela"]
    
    let inSpanish_EnglishOrder = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "República Dominicana", "Ecuador", "El Salvador", "Guinea Equatorial", "Guatemala", "Honduras", "México", "Nicaragua", "Panamá", "Paraguay", "Perú", "Puerto Rico", "España", "Estados Unidos", "Uruguay", "Venezuela"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
