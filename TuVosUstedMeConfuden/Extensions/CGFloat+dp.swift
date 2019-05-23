//
//  CGFloat+dp.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/18/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension CGFloat {
    
    var adjWidth: CGFloat {
        if Style.DeviceTypeSizes.smallIPhone {
            return (self / 320) * UIScreen.main.bounds.width
        } else if Style.DeviceTypeSizes.mediumIPhone || Style.DeviceTypeSizes.largeIPhone {
            return (self / 414) * UIScreen.main.bounds.width
        } else if Style.DeviceTypeSizes.iPad {
            return (self / 1024) * UIScreen.main.bounds.width
        } else {
            return self
        }
    }
    
    // this is only being used for formOfYou label at this point
    var adjWidth2: CGFloat {
        return (self / 1024) * UIScreen.main.bounds.width
    }
    
}
