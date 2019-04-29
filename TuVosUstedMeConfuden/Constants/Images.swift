//
//  Images.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/28/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

struct Images {
    
    var superarray = [[UIImage]]()
    
    let inEnglishOrder: [UIImage] = [UIImage(named: "argentina")!, UIImage(named: "bolivia")!, UIImage(named: "chile")!, UIImage(named: "colombia")!, UIImage(named: "costaRica")!, UIImage(named: "cuba")!, UIImage(named: "dominicanRepublic")!, UIImage(named: "ecuador")!, UIImage(named: "elSalvador")!, UIImage(named: "equatorialGuinea")!, UIImage(named: "guatemala")!, UIImage(named: "honduras")!, UIImage(named: "mexico")!, UIImage(named: "nicaragua")!, UIImage(named: "panama")!, UIImage(named: "paraguay")!, UIImage(named: "peru")!, UIImage(named: "puertoRico")!, UIImage(named: "spain")!, UIImage(named: "uruguay")!, UIImage(named: "venezuela")!]
    let inSpanishOrder = [UIImage(named: "argentina")!, UIImage(named: "bolivia")!, UIImage(named: "chile")!, UIImage(named: "colombia")!, UIImage(named: "costaRica")!, UIImage(named: "cuba")!, UIImage(named: "ecuador")!, UIImage(named: "elSalvador")!, UIImage(named: "spain")!, UIImage(named: "guatemala")!, UIImage(named: "equatorialGuinea")!, UIImage(named: "honduras")!, UIImage(named: "mexico")!, UIImage(named: "nicaragua")!, UIImage(named: "panama")!, UIImage(named: "paraguay")!,UIImage(named: "peru")!, UIImage(named: "puertoRico")!, UIImage(named: "dominicanRepublic")!, UIImage(named: "uruguay")!, UIImage(named: "venezuela")!]
    
    init() {
        superarray.append(inEnglishOrder)
        superarray.append(inSpanishOrder)
    }
    
}
