//
//  ExtraFunctions.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import Foundation

class ExtraFunctions {
    
    func getQuestion3s(country: String?, currentQuestionArray: [String], nextQuestionArray: [String]) -> [String] {
        
        var currentQuestion3: String?
        var nextQuestion3: String?
        var resultsArray = [String]()
        
        if country == "El Salvador" {
            currentQuestion3 = currentQuestionArray[3]
            nextQuestion3 = nextQuestionArray[3]
        } else if country == "Guatemala" || country == "Honduras" {
            currentQuestion3 = currentQuestionArray[4]
            nextQuestion3 = nextQuestionArray[4]
        } else if country == nil {
            currentQuestion3 = nil
            nextQuestion3 = nil
        } else {
            currentQuestion3 = currentQuestionArray[2]
            nextQuestion3 = nextQuestionArray[2]
        }
        
        resultsArray.append(currentQuestion3!)
        resultsArray.append(nextQuestion3!)
        
        return resultsArray
        
    }
    
    func matchOptionsArrayToCountry(country: String, countryArray: [String], superArray: [[String]]) -> [String] {
        
        // something like this goes on in Determine, 2nd func
        // this function name could probably be better
        
        let countryIndex = countryArray.firstIndex(of: country)!
        let optionsArray = superArray[countryIndex]
        
        return optionsArray
        
    }
    
}
