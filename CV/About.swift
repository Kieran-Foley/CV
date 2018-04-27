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
    @IBOutlet var logo: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Designs the linkedIn button.
        customTabBar.redrawLinkedIn(button: linkedIn)
        
        // Sets profile image attributes
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 62.5
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Sets attributes text 1
        let CVText1 = UILabel(frame: CGRect(x: 100, y: -125, width: 350, height: 75))
        let CVText1Attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 23.0)!]
        CVText1.attributedText = NSAttributedString(string: "Hi \(nameGlobal), Let Me", attributes: CVText1Attributes)
        self.view.addSubview(CVText1)
        
        // Sets attributes and for text 2
        let CVText2 = UILabel(frame: CGRect(x: 500, y: 55, width: 350, height: 75))
        let CVText2Attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 23.0)!]
        CVText2.attributedText = NSAttributedString(string: "Introduce Myself...", attributes: CVText2Attributes)
        self.view.addSubview(CVText2)
        
        /* Animations */
        // Logo
        UIView.animate(withDuration: 2.0) {
            self.logo.frame = CGRect(x: 10, y: 43, width: 75, height: 75)
        }
        // "Hi ... Let me"
        UIView.animate(withDuration: 2.0) {
            CVText1.frame = CGRect(x: 100, y: 30, width: 350, height: 75)
        }
        // "Introduce Myself"
        UIView.animate(withDuration: 2.0) {
            CVText2.frame = CGRect(x: 140, y: 60, width: 350, height: 75)
        }
        
    
        
//        let openingText = UILabel(frame: CGRect(x: 20, y: 178, width: 200, height: 125))

//        let openingTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 17.0)!]
//        openingText.numberOfLines = 10
//
//
//        openingText.attributedText = NSAttributedString(string: "My names's Kieran \u{1F44B} I'm a passionate 23 year old software developer currently studying at UWE Bristol.", attributes: openingTextAttributes)
//
//        let attributes = NSMutableAttributedString(string: "My names's Kieran \u{1F44B} I'm a passionate 23 year old software developer currently studying at UWE Bristol.", attributes: nil)
//
//        attributes.setAttributes([NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 17.0)!], range:1)
        
        
        let openingText = UILabel(frame: CGRect(x: 19, y: 178, width: 207, height: 150))
        let theString = "My names's Kieran \u{1F44B} I'm a passionate 23 year old software developer currently studying at UWE Bristol."
        let attributedString = NSMutableAttributedString(string: theString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        // Bold "Kieran"
        let boldFontAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 19.0)!]
        // Red "UWE Bristol"
        let redText = [NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!]
        attributedString.addAttributes(boldFontAttribute, range: NSMakeRange(11, 6))
        attributedString.addAttributes(redText, range: NSMakeRange(91, 11))
        openingText.numberOfLines = 10
        openingText.attributedText = attributedString
        self.view.addSubview(openingText)
        

        
            
        
        
        
        
        
        
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
