//
//  UILabel+determineStringSize.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/17/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension UILabel {
    
    func determineStringSize(button: UIButton, font: UIFont, myString: String) -> UIFont {
        
        let fontAttributes = [NSAttributedString.Key.font: font]
        let stringSize = (myString as NSString).size(withAttributes: fontAttributes)
        let numberOfLines = CGFloat(button.titleLabel!.numberOfLines)
        let maxHeight = (((numberOfLines - 1) * 1.8) + 1) * 0.8
        if (button.frame.size.width * numberOfLines) < stringSize.width && (button.frame.size.height * maxHeight) < stringSize.height {
            return determineStringSize(button: button, font: UIFont(name: "Meteoritox", size: font.pointSize - 1)!, myString: myString)
        } else {
            return UIFont(name: "Meteoritox", size: font.pointSize)!
        }
        
    }
    
}
