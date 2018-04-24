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

class MainView: UIViewController {

    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var tabBar: UIView!

    @IBOutlet var webView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redraw()
        
        let path = Bundle.main.path(forResource: "FinalCV", ofType: "pdf")
        // REMOVE FORCE UNWRAP
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        
        
        
    }
    
    func redraw() {
        linkedInButton.layer.cornerRadius = 35
        linkedInButton.layer.borderWidth = 3
        linkedInButton.layer.borderColor = UIColor.black.cgColor


    
    }

    @IBAction func linkedInPress(_ sender: Any) {
        if let url = URL(string: "https://www.linkedin.com/in/kieran-foley-130833138/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func CVPress(_ sender: Any) {

    }
    
    
    
    
}
