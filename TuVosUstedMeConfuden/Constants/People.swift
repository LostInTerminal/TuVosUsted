//
//  People.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

struct People {
    
    var superarray = [[String]]()
    
    let inEnglish = ["Family Member/Significant Other", "Friend", "Someone your age or younger", "Colleague in a formal setting", "An elder"]
    let inSpanish = ["Pariente/Pareja", "Amigo", "Alguien tu edad o mas joven", "Colega en una ambiente formal", "Un anciano"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
