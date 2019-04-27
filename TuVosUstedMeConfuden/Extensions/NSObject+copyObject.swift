//
//  NSObject+copyObject.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/27/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension NSObject {
    
    func copyObject<T:NSObject>() throws -> T? {
        
        let data = try NSKeyedArchiver.archivedData(withRootObject:self, requiringSecureCoding:false)
        return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
        
    }
    
}
