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


class CV: UIViewController {

    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var logo: UIImageView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the linkedIn button.
        customTabBar.redrawLinkedIn(button: linkedInButton)
        let path = Bundle.main.path(forResource: "CV", ofType: "pdf")
        // REMOVE FORCE UNWRAP
        let url = URL(fileURLWithPath: path!)
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Sets attributes for "Curriculum" text.
        let CVText1 = UILabel(frame: CGRect(x: 125, y: -125, width: 350, height: 75))
        let CVText1Attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 30.0)!]
        CVText1.attributedText = NSAttributedString(string: "CURRICULUM", attributes: CVText1Attributes)
        self.view.addSubview(CVText1)
        
        // Sets attributes and for "Vitae" text.
        let CVText2 = UILabel(frame: CGRect(x: 500, y: 55, width: 350, height: 75))
        let CVText2Attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 30.0)!]
        CVText2.attributedText = NSAttributedString(string: "VITAE", attributes: CVText2Attributes)
        self.view.addSubview(CVText2)
        
        /* Animations */
        // Logo
        UIView.animate(withDuration: 2.0) {
            self.logo.frame = CGRect(x: 10, y: 43, width: 75, height: 75)
        }
        
        // CV Webview
        UIView.animate(withDuration: 2.0) {
            self.webView.frame = CGRect(x: 0, y: 140, width: self.view.frame.width, height: self.view.frame.height-225)
        }
        
        // CURRICULUM text
        UIView.animate(withDuration: 2.0) {
            CVText1.frame = CGRect(x: 125, y: 30, width: 350, height: 75)
        }
        
        // VITAE text
        UIView.animate(withDuration: 2.0) {
            CVText2.frame = CGRect(x: 185, y: 60, width: 350, height: 75)
        }
        
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
