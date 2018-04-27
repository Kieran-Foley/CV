//
//  About.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit


var profileImage:UIImageView!

class About: UIViewController {
    
    @IBOutlet var linkedIn: UIButton!
    @IBOutlet var logo: UIImageView!

    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Designs the linkedIn button.
        customTabBar.redrawLinkedIn(button: linkedIn)

        guard let me:UIImage = UIImage(named: "me.jpeg") else {
            return
        }
        profileImage = UIImageView(image: me)
        
        
        // Sets profile image attributes
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 62.5
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2
        profileImage.frame = CGRect(x: -150, y: 178, width: 125, height: 125)
        self.view.addSubview(profileImage)
    
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
        
        // First paragraph - Adjacent to profile picture
        let openingText = UILabel(frame: CGRect(x: 19, y: 147.5, width: 207, height: 150))
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
        
        // First paragraph - Adjacent to profile picture
        let skillsLabel = UILabel(frame: CGRect(x: 150, y: 300, width: 210, height: 150))
        let skillsText = "My skills include iOS development, web technologies, C/C++ proggramming and database integration."
        let attributedSkillsText = NSMutableAttributedString(string: skillsText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        skillsLabel.numberOfLines = 10
        skillsLabel.attributedText = attributedSkillsText
        self.view.addSubview(skillsLabel)
        
        
        
        UIView.animate(withDuration: 1.5, animations: {
            profileImage.frame = CGRect(x: 234, y: 160, width: 125, height: 125)
            var rotationAnimation = CABasicAnimation()
            rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = NSNumber(value: (Double.pi))
            rotationAnimation.duration = 0.75
            rotationAnimation.isCumulative = true
            rotationAnimation.repeatCount = 2.0
            profileImage.layer.add(rotationAnimation, forKey: "rotationAnimation")
        })
        
//        var logosView:UIImageView!
//        let logoImages:[UIImage] = [UIImage(named: "swiftLogo.png")!, UIImage(named: "xcodeLogo.png")!, UIImage(named: "htmlLogo.png")!, UIImage(named: "c++Logo.png")!]
//        logosView.frame = CGRect(x: -150, y: 300, width: 125, height: 125)
//        
//        UIView.animate(withDuration: 1.5, animations: {
//            logosView.frame = CGRect(x: 75, y: 300, width: 125, height: 125)
//            logosView = UIImageView(image: logoImages[0])
//        }) { _ in
//            UIView.animate(withDuration: 1.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
//                logosView.frame = CGRect(x: 75, y: 300, width: 125, height: 125)
//                logosView = UIImageView(image: logoImages[1])
//            })
//        }
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
