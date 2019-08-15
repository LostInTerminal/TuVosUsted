//
//  QuestionButton.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/23/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class QuestionButton: UIButton {
    
    let fonts = Style.Fonts()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(Style.Colors.question, for: .normal)
        titleLabel?.font = titleLabel?.determineFontSizesBasedOnScreen(textType: "question")
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.addDividers()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class LangugeButton: UIButton {
    
    let fonts = Style.Fonts()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(Style.Colors.question, for: .normal)
        titleLabel?.font = titleLabel?.determineFontSizesBasedOnScreen(textType: "question")
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 3
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
