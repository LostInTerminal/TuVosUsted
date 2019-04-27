//
//  UIFont+setDefault.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 4/25/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension UIFont {
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Meteoritox", size: 17)!
        //return UIFont(name: "Noteworthy", size: 17)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor
        self.init(name: "Meteoritox", size: ((fontDescriptor?.pointSize)!))!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
    
}
