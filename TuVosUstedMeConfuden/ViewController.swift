//
//  ViewController.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 2/26/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = UIElements()
    let data = Data()
    
    var country: String!
    var person: String!
    var tertiaryDatum: String?
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        Transition.changeVariablesForRotation()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red: 56/255, green: 161/255, blue: 243/255, alpha: 1)
        super.viewWillAppear(true)
        DispatchQueue.main.async {
            Create.UIFor(vc: self)
        }
    }
    
}
