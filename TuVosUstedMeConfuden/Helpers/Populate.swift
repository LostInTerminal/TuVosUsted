//
//  Populate.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/29/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class Populate {
    
    static func regularDropdown(vc: ViewController, buttonTitles: [String], dropdown: UIStackView) {
        
        let size = Style.Size()
        
        var button: CGFloat = 0
        
        buttonTitles.forEach { (title) in
            let option = OptionButton(frame: CGRect(x: 0, y: button * size.boxHeight, width: size.boxWidth, height: size.boxHeight))
            
            dropdown.addSubview(option)
            option.anchor(top: dropdown.topAnchor, left: nil, bottom: nil, right: nil, centerX: dropdown.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: button * size.boxHeight, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight))
            option.backgroundColor = vc.view.backgroundColor//UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)//UIColor.clear
            option.setTitle(title, for: .normal)
            
            option.addDividersForOptionViews()
            
            button += 1
        }
        
    }
    
    static func dropdownWithExtraLayer(vc: ViewController, buttonTitles: [String], dropdown: UIStackView) {
        
        let size = Style.Size()
        
        var button = 0.0
        var x = 0
        var row: UIView?
        
        buttonTitles.forEach { (item) in
            
            if Int(button) % 2 == 0 {
                x = 0
                row = UIView()
                row?.backgroundColor = vc.view.backgroundColor
                dropdown.addSubview(row!)
                row?.anchor(top: dropdown.topAnchor, left: dropdown.leftAnchor, bottom: nil, right: dropdown.rightAnchor, centerX: vc.view.centerXAnchor, centerY: nil, padding: UIEdgeInsets(top: CGFloat(floor(button / 2)) * size.boxHeight, left: 0, bottom: 0, right: 0), centerXConstant: 0, centerYConstant: 0, size: CGSize(width: size.boxWidth, height: size.boxHeight))
            } else {
                x = Int(size.boxWidth / 2)
            }
            
            let option = OptionButton()
            
            var centerXAnchorConstant: CGFloat?
            if x == 0 {
                centerXAnchorConstant = -size.boxWidth / 4
            } else if x == Int(size.boxWidth / 2) {
                centerXAnchorConstant = size.boxWidth / 4
            }
            row?.addSubview(option)
            
            option.anchor(top: row!.topAnchor, left: nil, bottom: nil, right: nil, centerX: dropdown.centerXAnchor, centerY: nil, padding: nil, centerXConstant: centerXAnchorConstant!, centerYConstant: 0, size: CGSize(width: size.boxWidth / 2, height: size.boxHeight))
            option.setTitle(item, for: .normal)
            
            option.addDividersForOptionViews()
            option.backgroundColor = vc.view.backgroundColor
            
            button += 1
            
        }
        
    }
    
}
