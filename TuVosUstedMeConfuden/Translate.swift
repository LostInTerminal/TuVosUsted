//
//  Translate.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Translate {
    
    func question(language: String, question: String) -> String {//country: String?, person: String?, additionalInfo: String?) {
        
        let questions = Questions()
        var translatedWord = ""
        
        if language == "English" {
            
            let index = questions.inEnglish.firstIndex(of: question)
            translatedWord = questions.inSpanish[index!]
            
        } else if language == "Espanol" {
            
            let index = questions.inSpanish.firstIndex(of: question)
            translatedWord = questions.inEnglish[index!]
            
        }
        
        return translatedWord
        
    }
    
    func country(language: String, word: String) -> String {
        
        let countries = Countries()
        var translatedCountry = ""
        
        if language == "English" {
            
            let index = countries.inEnglish.firstIndex(of: word)
            translatedCountry = countries.inSpanish[index!]
            
        } else if language == "Espanol" {
            
            let index = countries.inSpanish.firstIndex(of: word)
            translatedCountry = countries.inEnglish[index!]
            
        }
        
        return translatedCountry
        
    }
    
    func person(language: String, word: String) -> String {
        
        let people = People()
        var translatedPerson = ""
        
        if language == "English" {
            
            let index = people.inEnglish.firstIndex(of: word)
            translatedPerson = people.inSpanish[index!]
            
        } else if language == "Espanol" {
            
            let index = people.inSpanish.firstIndex(of: word)
            translatedPerson = people.inEnglish[index!]
            
        }
        
        return translatedPerson
        
    }
    
    func tertiary(language: String, country: String, word: String) -> String {
        
        let tertiary = Tertiary()
        var translatedTertiary = ""
        
        if language == "English" {
            
            let countryArrayIndex = tertiary.countriesInEnglish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            let index = countryArray.firstIndex(of: word)
            let newCountryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            translatedTertiary = newCountryArray[index!]
            
        } else if language == "Espanol" {
            
            // for now, the first one is going to be changed to english, i may have to go back and change it later
            
            let countryArrayIndex = tertiary.countriesInSpanish.firstIndex(of: country)
            let countryArray = tertiary.optionsArrayInSpanish[countryArrayIndex!]
            let index = countryArray.firstIndex(of: word)
            let newCountryArray = tertiary.optionsArrayInEnglish[countryArrayIndex!]
            translatedTertiary = newCountryArray[index!]
            
        }
        
        return translatedTertiary
        
    }
    
    func image(language: String, image: UIImage) -> UIImage {
        
        let images = Images()
        var translatedImage: UIImage!
        
        if language == "English" {
            
            let index = images.inEnglishOrder.firstIndex(of: image)
            translatedImage = images.inSpanishOrder[index!]
            
        } else if language == "Espanol" {
            
            let index = images.inSpanishOrder.firstIndex(of: image)
            translatedImage = images.inEnglishOrder[index!]
            
        }
        
        return translatedImage
        
    }
    
}
