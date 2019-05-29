//
//  Translate.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Translate {
    
    func question(language: String, question: String) -> String {
        
        let questions = Questions()
        var translatedWord = ""
        
        if language == "English" {
            
            let index = questions.inSpanish.firstIndex(of: question)
            translatedWord = questions.inEnglish[index!]
            
        } else if language == "Español" {
            
            let index = questions.inEnglish.firstIndex(of: question)
            translatedWord = questions.inSpanish[index!]
            
        }
        
        return translatedWord
        
    }
    
    func country(language: String, word: String) -> String {
        
        let countries = Countries()
        var translatedCountry = ""
        
        if language == "English" {
    
            let index = countries.inSpanish_EnglishOrder.firstIndex(of: word)
            translatedCountry = countries.inEnglish[index!]
            
        } else if language == "Español" {
            
            let index = countries.inEnglish.firstIndex(of: word)
            translatedCountry = countries.inSpanish_EnglishOrder[index!]
            
        }
        
        return translatedCountry
        
    }
    
    func person(language: String, word: String) -> String {
        
        let people = People()
        var translatedPerson = ""
        
        if language == "English" {
            
            let index = people.inSpanish.firstIndex(of: word)
            translatedPerson = people.inEnglish[index!]
            
            
        } else if language == "Español" {
        
            let index = people.inEnglish.firstIndex(of: word)
            translatedPerson = people.inSpanish[index!]
            
        }
        
        return translatedPerson
        
    }
    
    func tertiary(language: String, country: String, word: String) -> String {
        
        let tertiary = Tertiary()
        var translatedTertiary = ""
        
        if language == "English" {
            
            let countryArrayIndex = tertiary.countriesInSpanish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            let index = countryArray.firstIndex(of: word)
            let newCountryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            translatedTertiary = newCountryArray[index!]
            
        } else if language == "Español" {
            let countryArrayIndex = tertiary.countriesInEnglish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            let index = countryArray.firstIndex(of: word)
            let newCountryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            translatedTertiary = newCountryArray[index!]
            
        }
        
        return translatedTertiary
        
    }
    
}
