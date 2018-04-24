//
//  MainView.swift
//  CV
//
//  Created by Kieran Foley on 26/01/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import Firebase
import WebKit
import JSQMessagesViewController


class CV: UIViewController {

    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var webView: WKWebView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the linkedIn button.
        customTabBar.redrawLinkedIn(button: linkedInButton)

        let path = Bundle.main.path(forResource: "FinalCV", ofType: "pdf")
        // REMOVE FORCE UNWRAP
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        webView.load(request)

    }

    // Declares the actions of all 5 tab bar buttons.
    @IBAction func tabBarButtonPushed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            customTabBar.aboutPushed(view:self)
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
