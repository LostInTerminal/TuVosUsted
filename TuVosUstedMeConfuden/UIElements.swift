//
//  UIElements.swift
//  TuVosUstedMeConfuden
//
//  Created by Matthew Beynon on 8/14/19.
//  Copyright © 2019 Matthew Beynon. All rights reserved.
//

import GoogleMobileAds
import UIKit

struct UIElements {
    let englishButton = UIButton()
    let spanishButton = UIButton()
    let countriesTextButton = QuestionButton()
    let countriesDropdown = UIStackView()
    let peopleTextButton = QuestionButton()
    let peopleDropdown = UIStackView()
    let formOfYouLabel = FormOfYouLabel()
    var bannerView = GADBannerView()
    var tertiaryTextButton: QuestionButton?
    var tertiaryDropdown: UIStackView?
}
