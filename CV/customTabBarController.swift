//
//  customTabBarController.swift
//  CV
//
//  Created by Kieran Foley on 24/04/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import Foundation
import UIKit

class customTabBarController {
    
    // Button Design
    func redrawLinkedIn(button:UIButton) {
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    // Buttons Pushed -> Move to different views
    func cvPushed(view:UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "2")
        view.present(newViewController, animated: false, completion: nil)
        
    }
    
    func aboutPushed(view:UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "3")
        view.present(newViewController, animated: false, completion: nil)
    }
    
    func linkedInPushed() {
        if let url = URL(string: "https://www.linkedin.com/in/kieran-foley-130833138/") {
            UIApplication.shared.open(url)
        }
    }
    
    func portfolioPushed(view:UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "4")
        view.present(newViewController, animated: false, completion: nil)
    }
    
    func contactPushed(view:UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "5")
        view.present(newViewController, animated: false, completion: nil)
    }
}

