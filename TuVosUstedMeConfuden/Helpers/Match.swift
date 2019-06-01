//
//  Match.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Match {
    
    func allFontSizes(vc: ViewController) {
        
        // it would probably be better to make arrays/collections/whatever of difference types (e.g. language, option, question, etc.)
        // this long shitty function is not needed if i switch to the other thing
        
        var minQuestionsSize: CGFloat = .greatestFiniteMagnitude
        var minLanguageSize: CGFloat = .greatestFiniteMagnitude
        var minOptionSize: CGFloat = .greatestFiniteMagnitude
        
        for case let button as UIButton in vc.view.subviews {
            if button.titleLabel!.text!.count < 8 {
                for case let label as UILabel in button.subviews {
                    label.font = label.determineFontSizesBasedOnScreen(textType: "language")
                    let font = label.determineStringSize(button: button, font: label.font, myString: label.text ?? "")
                    minLanguageSize = min(font.pointSize, minLanguageSize)
                }
            } else {
                for case let label as UILabel in button.subviews {
                    label.font = label.determineFontSizesBasedOnScreen(textType: "question")
                    let font = label.determineStringSize(button: button, font: label.font, myString: label.text ?? "")
                    minQuestionsSize = min(font.pointSize, minQuestionsSize)
                }
            }
        }
        
        for case let button as UIButton in vc.view.subviews {
            if button.titleLabel!.text!.count < 8 {
                for case let label as UILabel in button.subviews {
                    label.font = label.font.withSize(minLanguageSize)
                }
            } else {
                for case let label as UILabel in button.subviews {
                    label.font = label.font.withSize(minQuestionsSize)
                }
            }
        }
        
        // THIS IS GOING TO DEAL WITH THE DROPDOWN MENUS, MAKE ANOTHER THING FOR COUNTRIESDROPDOWN
        for case let dropdown as UIStackView in vc.view.subviews {
            if dropdown == vc.countriesDropdown {
                for subview in dropdown.subviews {
                    for case let button as UIButton in subview.subviews {
                        for case let label as UILabel in button.subviews {
                            label.font = label.determineFontSizesBasedOnScreen(textType: "answer")
                            let font = label.determineStringSize(button: button, font: label.font, myString: label.text ?? "")
                            minOptionSize = min(font.pointSize, minOptionSize)
                        }
                    }
                }
            } else {
                for case let button as UIButton in dropdown.subviews {
                    for case let label as UILabel in button.subviews {
                        label.font = label.determineFontSizesBasedOnScreen(textType: "answer")
                        let font = label.determineStringSize(button: button, font: label.font, myString: label.text ?? "")
                        minOptionSize = min(font.pointSize, minOptionSize)
                    }
                }
            }
        }
        
        for case let dropdown as UIStackView in vc.view.subviews {
            if dropdown == vc.countriesDropdown {
                for subview in dropdown.subviews {
                    for case let button as UIButton in subview.subviews {
                        for case let label as UILabel in button.subviews {
                            label.font = label.font.withSize(minOptionSize)
                        }
                    }
                }
            } else {
                for case let button as UIButton in dropdown.subviews {
                    for case let label as UILabel in button.subviews {
                        label.font = label.font.withSize(minOptionSize)
                    }
                }
            }
        }
        
    }
    
}
