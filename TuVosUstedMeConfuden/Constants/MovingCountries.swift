//
//  MovingCountries.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

// I shouldn't need to user this class

struct MovingCountries {
    
    var superarray = [[String]]()
    
    let inEnglish = ["Dominican Republic", "Ecuador", "El Salvador", "Equatorial Guinea", "Guatemala", "Spain"]
    let inSpanish = ["República Dominicana", "Ecuador", "El Salvador", "Guinea Equatorial", "Guatemala", "España"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
