//
//  Resize.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/23/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Resize {
    
    let itemsToResize = ItemsToResize()
    let questions = Questions()
    let tertiary = Tertiary()
    
    func countryTextButtonIfNeeded(vc: ViewController) {
        
        var constraintToUpdate: NSLayoutConstraint!
        
        for constraint in vc.countriesTextButton.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == Style.Size.boxHeight || constraint.constant == Style.Size.boxHeight * 1.8 {
                constraintToUpdate = constraint
            }
        }
        
        if vc.country != nil {
            if questions.inEnglish.contains(vc.countriesTextButton.titleLabel!.text!) || questions.inSpanish.contains(vc.countriesTextButton.titleLabel!.text!) {
                constraintToUpdate.constant = Style.Size.boxHeight * 1.8
            } else {
                constraintToUpdate.constant = Style.Size.boxHeight
            }
        } else {
            constraintToUpdate.constant = Style.Size.boxHeight
        }
        
        vc.view.layoutIfNeeded()
        
    }
    
    func peopleTextButtonIfNeeded(vc: ViewController) {
        
        var constraintToUpdate: NSLayoutConstraint!
        
        for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == Style.Size.boxHeight || constraint.constant == Style.Size.boxHeight * 1.8 {
                constraintToUpdate = constraint
            }
        }
        
        if vc.person != nil {
            if itemsToResize.peopleToResize.contains(vc.person) {
                constraintToUpdate.constant = Style.Size.boxHeight * 1.8
            } else {
                constraintToUpdate.constant = Style.Size.boxHeight
            }
        }
        
        vc.view.layoutIfNeeded()
        
    }
    
    func tertiaryTextButtonIfNeeded(vc: ViewController) {
        
        var constraintToUpdate: NSLayoutConstraint!
        
        for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
            if constraint.constant == Style.Size.boxHeight || constraint.constant == Style.Size.boxHeight * 1.8 || constraint.constant == Style.Size.boxHeight * 2.6 {
                constraintToUpdate = constraint
            }
        }
        
        // it should be double if the question is showing
        if (tertiary.specialOptions.contains(vc.country) && questions.inEnglish.contains(vc.tertiaryTextButton!.titleLabel!.text!)) || questions.inSpanish.contains(vc.tertiaryTextButton!.titleLabel!.text!) || itemsToResize.mediumRegions.contains(vc.tertiaryDatum ?? "") {
            constraintToUpdate.constant = Style.Size.boxHeight * 1.8
        } else if itemsToResize.largeRegions.contains(vc.tertiaryDatum ?? "") {
            constraintToUpdate.constant = Style.Size.boxHeight * 2.6
        } else {
            constraintToUpdate.constant = Style.Size.boxHeight
        }
        vc.view.layoutIfNeeded()
        
    }
    
    func allTextButtonsForSpanish(vc: ViewController) {
        
        print("resizing for Spanish")
        
        let originalSize: CGFloat = Style.Size.boxHeight
        let newSize: CGFloat = Style.Size.boxHeight * 1.8
        
        for constraint in vc.countriesTextButton.constraintsAffectingLayout(for: .vertical) {
            if questions.inEnglish.contains(vc.countriesTextButton.titleLabel!.text!) || questions.inSpanish.contains(vc.countriesTextButton.titleLabel!.text!) {
                if constraint.constant == originalSize || constraint.constant == newSize {
                    let constraintToUpdate = constraint
                    constraintToUpdate.constant = questions.inSpanish.contains(vc.countriesTextButton.titleLabel!.text!) ? newSize : originalSize
                }
            }
        }
        
        for constraint in vc.peopleTextButton.constraintsAffectingLayout(for: .vertical) {
            if questions.inEnglish.contains(vc.peopleTextButton.titleLabel!.text!) || questions.inSpanish.contains(vc.peopleTextButton.titleLabel!.text!) {
                if constraint.constant == originalSize || constraint.constant == newSize {
                    let constraintToUpdate = constraint
                    constraintToUpdate.constant = questions.inSpanish.contains(vc.peopleTextButton.titleLabel!.text!) ? newSize : originalSize
                }
            }
        }
        
        if vc.tertiaryTextButton != nil {
            for constraint in vc.tertiaryTextButton!.constraintsAffectingLayout(for: .vertical) {
                if questions.inEnglish.contains(vc.tertiaryTextButton!.titleLabel!.text!) || questions.inSpanish.contains(vc.tertiaryTextButton!.titleLabel!.text!) {
                    if constraint.constant == originalSize || constraint.constant == newSize {
                        let constraintToUpdate = constraint
                        constraintToUpdate.constant = questions.inSpanish.contains(vc.peopleTextButton.titleLabel!.text!) ? newSize : originalSize
                    }
                }
            }
        }
        
        vc.view.layoutIfNeeded()
        
    }
    
}
