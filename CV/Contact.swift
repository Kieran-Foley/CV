//
//  Contact.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit

class Contact: UIViewController {
    
    
    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var logo: UIImageView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Design's the linkedIn button
        customTabBar.redrawLinkedIn(button: linkedInButton)
        
        logo.frame = CGRect(x: self.view.frame.width/2-75, y: 20, width: 150, height: 150)
        
        let headerText = UILabel(frame: CGRect(x: self.view.frame.width/2-162.5, y: 165, width: 325, height: 150))
        let theString = "Thankyou \(nameGlobal), for taking the time to check out my app! I really do hope to hear back from you (even if it's just for some advice on how to improve it).\nHere are my contact details..."
        let attributedString = NSMutableAttributedString(string: theString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        headerText.numberOfLines = 10
        headerText.textAlignment = NSTextAlignment.center
        
        // light bracket text
        let lightFontAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Condensed", size: 19.0)!]
        
        attributedString.addAttributes(lightFontAttribute, range: NSMakeRange(91, 57))
        headerText.attributedText = attributedString
        self.view.addSubview(headerText)
        
        
        
        
        
        
        
        //        // Red "UWE Bristol"
        //        let redText = [NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!]
        //        attributedString.addAttributes(boldFontAttribute, range: NSMakeRange(11, 6))
        
        
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
            customTabBar.portfolioPushed(view:self)
        case 5:
            break;
        default:
            break
        }
    }
    
}

