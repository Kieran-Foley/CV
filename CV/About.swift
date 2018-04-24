//
//  About.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit

class About: UIViewController {
    
    
    
    @IBOutlet var linkedIn: UIButton!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Designs the linkedIn button.
        customTabBar.redrawLinkedIn(button: linkedIn)

    }

    // Declares the actions of all 5 tab bar buttons.
    @IBAction func tabBarButtonPushed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            customTabBar.cvPushed(view:self)
        case 2:
            break
        case 3:
            customTabBar.linkedInPushed()
        case 4:
            customTabBar.portfolioPushed(view:self)
        case 5:
            customTabBar.contactPushed(view:self)
        default:
            break
        }
    }

}
