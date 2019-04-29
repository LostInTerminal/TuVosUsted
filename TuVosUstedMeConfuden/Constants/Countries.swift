//
//  Countries.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

struct Countries {
    
    var superarray = [[String]]()
    
    let inEnglish = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Equatorial Guinea", "Guatemala", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Puerto Rico", "Spain", "Uruguay", "Venezuela"]
    let inSpanish = ["Argentina", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Ecuador", "El Salvador", "España", "Guatemala", "Guinea Equatorial", "Honduras", "México", "Nicaragua", "Panamá", "Paraguay", "Perú", "Puerto Rico", "República Dominicana", "Uruguay", "Venezuela"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
