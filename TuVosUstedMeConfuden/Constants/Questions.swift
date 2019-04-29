//
//  Questions.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

struct Questions {
    
    var superarray = [[String]]()
    
    let inEnglish = ["what country are you in", "who are you talking to", "what region will you be visiting", "which of the following best describes the situation", "is the conversation between two men"]
    let inSpanish = ["en que país estás/estáis/está", "con quien hablas/habláis/habla", "qué región va/vas/vais a visitar", "cuál de los siguientes describe mejor la situación", "es la conversación entre dos hombres"]
    
    init() {
        superarray.append(inEnglish)
        superarray.append(inSpanish)
    }
    
}
