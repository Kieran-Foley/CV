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

        // Sets attributes for "Projects" text.
        let cvLabel = UILabel(frame: CGRect(x: 550, y: 45, width: 200, height: 75))
        let cvText = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 30.0)!]
        cvLabel.attributedText = NSAttributedString(string: "Curriculum\nVitae", attributes: cvText)
        cvLabel.numberOfLines = 2
        cvLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(cvLabel)
        
        /* Animations */
        UIView.animate(withDuration: 1, animations: {
            self.logo.frame = CGRect(x: 10, y: 43, width: 75, height: 75)
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                
                cvLabel.frame = CGRect(x: self.view.frame.width/4*3-170, y: 45, width: 200, height: 75)
                self.view.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                    cvLabel.frame = CGRect(x: self.view.frame.width/4*3-150, y: 45, width: 200, height: 75)
                })
            }
        }
        // CV Webview
        UIView.animate(withDuration: 2.0) {
            self.webView.frame = CGRect(x: 0, y: 140, width: self.view.frame.width, height: self.view.frame.height-225)
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
