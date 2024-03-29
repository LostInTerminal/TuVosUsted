//
//  UIView+addDividers.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 5/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDividers() {
        
        let size = Style.Size()
        
        let topBorderView = UIView()
        topBorderView.backgroundColor = UIColor.white
        topBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topBorderView)
        bringSubviewToFront(topBorderView)
        topBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topBorderView.widthAnchor.constraint(equalToConstant: size.boxWidth).isActive = true
        topBorderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        bringSubviewToFront(bottomBorderView)
        bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func addDividersForOptionViews() {
        
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        bringSubviewToFront(bottomBorderView)
        bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
}
