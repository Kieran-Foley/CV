//
//  Contact.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import MessageUI

class Contact: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var logo: UIImageView!
    
    // New instance of tabBar -> control the design / functionality
    let customTabBar = customTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Design's the linkedIn button
        customTabBar.redrawLinkedIn(button: linkedInButton)
        
        // Set the position for the logo
        logo.frame = CGRect(x: self.view.frame.width/2-75, y: 20, width: 150, height: 150)
        
        // Main text label
        let headerText = UILabel(frame: CGRect(x: self.view.frame.width/2-162.5, y: 165, width: 325, height: 150))
        let theString = "Thankyou \(nameGlobal), for taking the time to check out my app! I really do hope to hear back from you (even if it's just for some advice on how to improve it).\nHere are my contact details..."
        let attributedString = NSMutableAttributedString(string: theString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 19.0)!])
        headerText.numberOfLines = 10
        headerText.textAlignment = NSTextAlignment.center
        // light bracket text
        let lightFontAttribute = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter-Condensed", size: 19.0)!]
        attributedString.addAttributes(lightFontAttribute, range: NSMakeRange(91, 57))
        headerText.attributedText = attributedString
        // Add label to view
        self.view.addSubview(headerText)

        
        // Phone label
        let phoneLabel = UILabel(frame: CGRect(x: 30, y: 325, width: 200, height: 50))
        let phoneText = NSMutableAttributedString(string: "Phone", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 50.0)!])
        phoneLabel.attributedText = phoneText
        // Add label to view
        self.view.addSubview(phoneLabel)
        
        // Phone image -> call my Number
        let phoneButton = UIButton(type: UIButtonType.custom)
        guard let phoneImage:UIImage = UIImage(named: "phoneIcon.png") else {
            return
        }
        phoneButton.setImage(phoneImage, for: .normal)
        phoneButton.frame = CGRect(x:  self.view.frame.width/4*3-25, y: 325, width: 50, height: 50)
        self.view.addSubview(phoneButton)
        phoneButton.addTarget(self, action: #selector(self.makeAPhoneCall), for: .touchUpInside)
        
        
        // Email label
        let emailLabel = UILabel(frame: CGRect(x: self.view.frame.width-230, y: 400, width: 200, height: 50))
        let emailText = NSMutableAttributedString(string: "E-Mail", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 50.0)!])
        emailLabel.textAlignment = NSTextAlignment.right
        emailLabel.attributedText = emailText
        // Add label to view
        self.view.addSubview(emailLabel)
        
        // Mail Button -> compose new mail
        let mailButton = UIButton(type: UIButtonType.custom)
        guard let emailImage:UIImage = UIImage(named: "mailIcon") else {
            return
        }
        mailButton.setImage(emailImage, for: .normal)
        mailButton.frame = CGRect(x: self.view.frame.width/4-25, y: 400, width: 50, height: 50)
        self.view.addSubview(mailButton)
        mailButton.addTarget(self, action: #selector(self.mailButtonPressed), for: .touchUpInside)
        
        
        // Instagram Label
        let instagramLabel = UILabel(frame: CGRect(x: self.view.frame.width/4-100, y: 475, width: 200, height: 50))
        let instagramText = NSMutableAttributedString(string: "Instagram", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 30.0)!])
        instagramLabel.attributedText = instagramText
        instagramLabel.textAlignment = NSTextAlignment.center

        // Add label to view
        self.view.addSubview(instagramLabel)
        
        // Instagram Button -> Open instagram app
        let instagramButton = UIButton(type: UIButtonType.custom)
        guard let instagramImage:UIImage = UIImage(named: "instagramLogo.png") else {
            return
        }
        instagramButton.setImage(instagramImage, for: .normal)
        instagramButton.frame = CGRect(x:  self.view.frame.width/4-25 ,y: 535, width: 50, height: 50)
        self.view.addSubview(instagramButton)
        instagramButton.addTarget(self, action: #selector(self.instagramButtonPushed), for: .touchUpInside)
        
        
        // Facebook Label
        let FacebookLabel = UILabel(frame: CGRect(x: self.view.frame.width/4*3-100, y: 475, width: 200, height: 50))
        let FacebookText = NSMutableAttributedString(string: "Facebook", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AmericanTypewriter", size: 30.0)!])
        FacebookLabel.textAlignment = NSTextAlignment.center
        FacebookLabel.attributedText = FacebookText
        // Add label to view
        self.view.addSubview(FacebookLabel)
        
        // Facebook Button -> Open Facebook app
        let facebookButton = UIButton(type: UIButtonType.custom)
        guard let facebookImage:UIImage = UIImage(named: "facebookLogo.png") else {
            return
        }
        facebookButton.setImage(facebookImage, for: .normal)
        facebookButton.frame = CGRect(x: self.view.frame.width/4*3-25 ,y: 535, width: 50, height: 50)
        self.view.addSubview(facebookButton)
        facebookButton.addTarget(self, action: #selector(self.facebookButtonPushed), for: .touchUpInside)

    }
    
    // Phone image has been pushed, display call alert.
    @objc func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://07715449909")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    
    // Mail contact button has been pushed, compose a new email
    @objc func mailButtonPressed() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["Kieran-19@hotmail.co.uk"])
            mail.setSubject("RE: iOS App Reply")
            present(mail, animated: true, completion: nil)
        } else {
            print("Cannot send mail")
            // give feedback to the user
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    // Load up Instagram
    @objc func instagramButtonPushed()  {
        if let url = URL(string: "https://www.instagram.com/kfapplications/?hl=en") {
            UIApplication.shared.open(url)
        }
    }
    
    
    // Load up Facebook
    @objc func facebookButtonPushed()  {
        if let url = URL(string: "https://www.facebook.com/kieran.foley.9") {
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
            customTabBar.portfolioPushed(view:self)
        case 5:
            break;
        default:
            break
        }
    }
    
}

