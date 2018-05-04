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
    
    // Logo image
    @IBOutlet var logo: UIImageView!
    
    // View to store all 4 language buttons
    @IBOutlet var buttonView: UIView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the linkedIn button
        customTabBar.redrawLinkedIn(button: linkedInButton)
        
        // Initial locations before animations
        self.logo.frame = CGRect(x: self.view.frame.width/2-75, y: 45, width: 150, height: 150)
        self.buttonView.frame = CGRect(x: 16, y: 140, width: self.view.frame.width-32, height: 50)
        self.buttonView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {

        /* Animations */
        // Change position of logo -> fade in buttons.
        UIView.animate(withDuration: 1.5, animations: {
            self.logo.frame = CGRect(x: 10, y: 43, width: 75, height: 75)
        }) { _ in
            UIView.animate(withDuration: 1.5, delay: 0.25, options: [], animations: {
                 self.buttonView.alpha = 1
            })
        }


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
