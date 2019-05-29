//
//  QuestionButton.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/23/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class QuestionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(Style.Colors.question, for: .normal)
        titleLabel?.font = Style.Fonts.question
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 3
        //titleLabel?.adjustsFontSizeToFitWidth = true
        addDividers()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class LangugeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(Style.Colors.question, for: .normal)
        titleLabel?.font = Style.Fonts.question
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 3
        //titleLabel?.adjustsFontSizeToFitWidth = true
        addDividers()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
