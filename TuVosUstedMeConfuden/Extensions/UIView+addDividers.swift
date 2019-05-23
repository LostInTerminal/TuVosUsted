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
        // .999 INSTEAD OF .99 DOESNT GIVE DOUBLED LOOK FOR SHARED BOTTOM/TOP
        
        let topBorderView = UIView()
        topBorderView.backgroundColor = UIColor.white
        topBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topBorderView)
        bringSubviewToFront(topBorderView)
        topBorderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topBorderView.widthAnchor.constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        topBorderView.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight * 0.01).isActive = true
        
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        bringSubviewToFront(bottomBorderView)
        bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight * 0.01).isActive = true
        
    }
    
    func addDividersForOptionViews() {
        
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomBorderView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true//constraint(equalToConstant: Style.Size.boxWidth).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: Style.Size.boxHeight * 0.01).isActive = true
        
    }
    
}
