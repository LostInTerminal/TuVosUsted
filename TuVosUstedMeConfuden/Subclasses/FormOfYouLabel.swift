//
//  FormOfYouLabel.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/23/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class FormOfYouLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = Style.Colors.result
        font = Style.Fonts.result
        textAlignment = .center
        numberOfLines = 2
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
