//
//  UIView+anchoringFunctions.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, padding: UIEdgeInsets?, centerXConstant: CGFloat, centerYConstant: CGFloat, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding?.top ?? 0).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding?.left ?? 0).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding?.bottom ?? 0).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: padding?.right ?? 0).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
}
