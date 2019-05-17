//
//  Questions.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

struct Questions {
    
    var superarray = [[String]]()
    
    let inEnglish = ["what country are you in?", "who are you talking to?", "what region are you in?", "is this an informal conversation?", "is the conversation between two men?"]
    let inSpanish = ["¿en que país estás/estáis/está?", "¿con quien hablas/habláis/habla?", "¿en qué región estás/estáis/está?", "¿es esta conversación informal?", "¿es esta conversación entre dos hombres?"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
