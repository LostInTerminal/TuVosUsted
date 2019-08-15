//
//  FormOfYouLabel.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/23/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class FormOfYouLabel: UILabel {
    
    let fonts = Style.Fonts()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = Style.Colors.result
        font = determineFontSizesBasedOnScreen(textType: "result")
        textAlignment = .center
        numberOfLines = 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
