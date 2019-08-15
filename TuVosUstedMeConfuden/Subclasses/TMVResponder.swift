//
//  TMVResponder.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 6/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class TMVResponder {
    
    func viewController(forView view: UIView) -> UIViewController? {
        
        var responder = view as? UIResponder
        
        while (responder != nil) {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            responder = responder?.next
        }
        
        return nil
    }
    
}
