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
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var subView1: UIView!
    @IBOutlet var subView2: UIView!
    @IBOutlet var subView3: UIView!
    @IBOutlet var subView4: UIView!
    
    
    
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Designs the linkedIn button
        customTabBar.redrawLinkedIn(button: linkedInButton)
        
        // Initial locations before animations
        self.logo.frame = CGRect(x: self.view.frame.width/2-75, y: 45, width: 150, height: 150)
        mainView.alpha = 0
        self.mainView.frame = CGRect(x: 16, y: 140, width: self.view.frame.width-32, height: self.view.frame.height-225)
        
        // Sets attributes for "Projects" text.
        let projectLabel = UILabel(frame: CGRect(x: 550, y: 45, width: 350, height: 75))
        let projectText = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 50.0)!]
        projectLabel.attributedText = NSAttributedString(string: "Projects", attributes: projectText)
        self.view.addSubview(projectLabel)
        
        // Subviews
        self.subView1.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height/4)
        self.subView2.frame = CGRect(x: 0, y: mainView.frame.height/4, width: mainView.frame.width, height: mainView.frame.height/4)
        self.subView3.frame = CGRect(x: 0, y: mainView.frame.height/2, width: mainView.frame.width, height: mainView.frame.height/4)
        self.subView4.frame = CGRect(x: 0, y: mainView.frame.height/4*3, width: mainView.frame.width, height: mainView.frame.height/4)
        
        
        /************************************************************* Subview one - Game of Thrones *************************************************************/
        // Label
        let gotLabel = UILabel(frame: CGRect(x: 10 , y: 0, width: 225, height: 60))
        let gotText = "Game of Thrones\nQuiz & Trivia"
        let attributedString = NSMutableAttributedString(string: gotText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        let titleAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 25.0)!]
        let titleAttribute2 = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 19.0)!]
        attributedString.addAttributes(titleAttribute, range: NSMakeRange(0, 16))
        attributedString.addAttributes(titleAttribute2, range: NSMakeRange(16, 13))
        gotLabel.numberOfLines = 2
        gotLabel.attributedText = attributedString
        gotLabel.textAlignment = NSTextAlignment.center
        self.subView1.addSubview(gotLabel)
        
        // Description
        let gotDescLabel = UILabel(frame: CGRect(x: 10, y: self.subView1.frame.height/2, width: 235, height: 50))
        let gotDescText = "A simple quiz and trivia about the show Game of Thrones.\nClick image for Github link."
        let gotAttributedString = NSMutableAttributedString(string: gotDescText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 13.0)!])
        gotDescLabel.attributedText = gotAttributedString
        gotDescLabel.textAlignment = NSTextAlignment.center
        gotDescLabel.numberOfLines = 4
        self.subView1.addSubview(gotDescLabel)
        
        // Game of Thrones Button -> Open Github repo
        let gotButton = UIButton(type: UIButtonType.custom)
        guard let gotImage:UIImage = UIImage(named: "gotImage.png") else {
            return
        }
        gotButton.setImage(gotImage, for: .normal)
        gotButton.layer.cornerRadius = 10
        gotButton.layer.borderWidth = 2
        gotButton.layer.borderColor = UIColor.white.cgColor
        gotButton.frame = CGRect(x: self.subView1.frame.width-90, y: self.subView1.frame.height/2-37.5, width: 75, height: 75)
        self.subView1.addSubview(gotButton)
        gotButton.addTarget(self, action: #selector(self.gotButtonPushed), for: .touchUpInside)
        
        /************************************************************* Subview Two - CV *************************************************************/
        // Label
        let mbLabel = UILabel(frame: CGRect(x: self.subView2.frame.width-245 , y: 0, width: 235, height: 30))
        let mbText = "micro:Bit Programs"
        let mbattributedString = NSMutableAttributedString(string: mbText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        let mbTitleAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 23.0)!]
        mbattributedString.addAttributes(mbTitleAttribute, range: NSMakeRange(0, 18))
        mbLabel.numberOfLines = 2
        mbLabel.attributedText = mbattributedString
        mbLabel.textAlignment = NSTextAlignment.center
        self.subView2.addSubview(mbLabel)
        
        // Description
        let mbDescLabel = UILabel(frame: CGRect(x: self.subView2.frame.width-245, y: self.subView1.frame.height/2-35, width: 235, height: 90))
        let mbDescText = "Programs and protocols installed into microBits using C++ including Morse code transmition, radiowave protocols a simple games.\nClick image for Github link."
        let mbAttributedString = NSMutableAttributedString(string: mbDescText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 12.5)!])
        mbDescLabel.attributedText = mbAttributedString
        mbDescLabel.textAlignment = NSTextAlignment.center
        mbDescLabel.numberOfLines = 5
        self.subView2.addSubview(mbDescLabel)
        
        // microBit Button -> Open Github repo
        let mbButton = UIButton(type: UIButtonType.custom)
        guard let mbImage:UIImage = UIImage(named: "microBitIcon.png") else {
            return
        }
        mbButton.setImage(mbImage, for: .normal)
        mbButton.layer.cornerRadius = 14
        mbButton.layer.borderWidth = 2
        mbButton.layer.borderColor = UIColor.white.cgColor
        mbButton.frame = CGRect(x: 15, y: self.subView1.frame.height/2-37.5, width: 75, height: 75)
        self.subView2.addSubview(mbButton)
        mbButton.addTarget(self, action: #selector(self.mbButtonPushed), for: .touchUpInside)
        
        
        /************************************************************* Subview Three - Messaging *************************************************************/
        
        // Label
        let messagingLabel = UILabel(frame: CGRect(x: 10 , y: 0, width: 225, height: 60))
        let messagingText = "Instant Messaging\nFirebase"
        let messagingattributedString = NSMutableAttributedString(string: messagingText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        let messagingtitleAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 23.0)!]
        let messagingtitleAttribute2 = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 19.0)!]
        messagingattributedString.addAttributes(messagingtitleAttribute, range: NSMakeRange(0, 17))
        messagingattributedString.addAttributes(messagingtitleAttribute2, range: NSMakeRange(18, 8))
        messagingLabel.numberOfLines = 2
        messagingLabel.attributedText = messagingattributedString
        messagingLabel.textAlignment = NSTextAlignment.center
        self.subView3.addSubview(messagingLabel)
        
        // Description
        let messagingDescLabel = UILabel(frame: CGRect(x: 10, y: self.subView1.frame.height/2, width: 235, height: 50))
        let messagingDescText = "An instant messaging app using the Firebase framework.\nClick image for Github link."
        let messagingAttributedString = NSMutableAttributedString(string: messagingDescText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 13.0)!])
        messagingDescLabel.attributedText = messagingAttributedString
        messagingDescLabel.textAlignment = NSTextAlignment.center
        messagingDescLabel.numberOfLines = 4
        self.subView3.addSubview(messagingDescLabel)
        
        // Messaging -> Open Github repo
        let messagingButton = UIButton(type: UIButtonType.custom)
        guard let messagingImage:UIImage = UIImage(named: "firebaseIcon.png") else {
            return
        }
        messagingButton.setImage(messagingImage, for: .normal)
        messagingButton.layer.cornerRadius = 10
        messagingButton.layer.borderWidth = 2
        messagingButton.layer.borderColor = UIColor.white.cgColor
        messagingButton.frame = CGRect(x: self.subView1.frame.width-90, y: self.subView1.frame.height/2-37.5, width: 75, height: 75)
        self.subView3.addSubview(messagingButton)
        messagingButton.addTarget(self, action: #selector(self.messagingButtonPushed), for: .touchUpInside)
        
        
        /************************************************************* Subview Four - Website *************************************************************/
        
        
        
        // Label
        let wsLabel = UILabel(frame: CGRect(x: self.subView2.frame.width-245 , y: 0, width: 235, height: 60))
        let wsText = "Website\nHTML, CSS & JS"
        let wsAttributedString = NSMutableAttributedString(string: wsText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 17.0)!])
        let wsTitleAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 25.0)!]
        let wsTitleAttribute2 = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 17.0)!]
        wsAttributedString.addAttributes(wsTitleAttribute, range: NSMakeRange(0, 7))
        wsAttributedString.addAttributes(wsTitleAttribute2, range: NSMakeRange(8, 14))
        wsLabel.numberOfLines = 2
        wsLabel.attributedText = wsAttributedString
        wsLabel.textAlignment = NSTextAlignment.center
        self.subView4.addSubview(wsLabel)

        // Description
        let wsDescLabel = UILabel(frame: CGRect(x: self.subView2.frame.width-245, y: self.subView1.frame.height/2-10, width: 235, height: 90))
        let wsDescText = "My portfolio website.\nClick image for Github link."
        let wsAttributedDesc = NSMutableAttributedString(string: wsDescText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 13.0)!])
        wsDescLabel.attributedText = wsAttributedDesc
        wsDescLabel.textAlignment = NSTextAlignment.center
        wsDescLabel.numberOfLines = 5
        self.subView4.addSubview(wsDescLabel)
        
        // microBit Button -> Open Github repo
        let wsButton = UIButton(type: UIButtonType.custom)
        guard let wsImage:UIImage = UIImage(named: "Logo1.png") else {
            return
        }
        wsButton.setImage(wsImage, for: .normal)
        wsButton.frame = CGRect(x: 15, y: self.subView1.frame.height/2-37.5, width: 75, height: 75)
        self.subView4.addSubview(wsButton)
        wsButton.addTarget(self, action: #selector(self.mbButtonPushed), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Sets attributes for "Projects" text.
        let projectLabel = UILabel(frame: CGRect(x: 550, y: 45, width: 350, height: 75))
        let projectText = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Bold", size: 50.0)!]
        projectLabel.attributedText = NSAttributedString(string: "Projects", attributes: projectText)
        self.view.addSubview(projectLabel)

        /* Animations */
        // Change position of logo -> fade in buttons.
        UIView.animate(withDuration: 1, animations: {
            self.logo.frame = CGRect(x: 10, y: 43, width: 75, height: 75)
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                
                projectLabel.frame = CGRect(x: self.view.frame.width/4*3-170, y: 45, width: 350, height: 75)
                self.mainView.alpha = 1
            }) { _ in
                 UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                    projectLabel.frame = CGRect(x: self.view.frame.width/4*3-150, y: 45, width: 350, height: 75)
                 })
            }
        }
    }
    
    @objc func gotButtonPushed() {
        if let url = URL(string: "https://github.com/Kieran-Foley/GOT-Trivia-QuizRepo") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func mbButtonPushed() {
        if let url = URL(string: "https://github.com/Kieran-Foley/microBit-Morsecode") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func messagingButtonPushed() {
        if let url = URL(string: "https://github.com/Kieran-Foley/messagingApp") {
            UIApplication.shared.open(url)
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
