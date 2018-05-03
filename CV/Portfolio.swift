//
//  Portfolio.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit

class Portfolio: UIViewController {

    @IBOutlet weak var linkedInButton: UIButton!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the linkedIn button
        customTabBar.redrawLinkedIn(button: linkedInButton)

    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

    
    // Declares the actions of all 5 tab bar buttons.
    @IBAction func tabBarButtonPushed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            customTabBar.cvPushed(view:self)
        case 2:
            customTabBar.aboutPushed(view:self)
        case 3:
            customTabBar.linkedInPushed()
        case 4:
            break;
        case 5:
            customTabBar.contactPushed(view:self)
        default:
            break
        }
    }

}
