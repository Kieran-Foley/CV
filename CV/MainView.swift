//
//  MainView.swift
//  CV
//
//  Created by Kieran Foley on 26/01/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import Firebase

class MainView: UIViewController {

    @IBOutlet var linkedInButton: UIButton!
    @IBOutlet var tabBar: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        redraw()
    }
    
    func redraw() {
        linkedInButton.layer.cornerRadius = 35
        linkedInButton.layer.borderWidth = 1
        linkedInButton.layer.borderColor = UIColor.white.cgColor


    
    }

    @IBAction func linkedInPress(_ sender: Any) {
        if let url = URL(string: "https://www.linkedin.com/in/kieran-foley-130833138/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func CVPress(_ sender: Any) {
        let url = Bundle.main.url(forResource: "FinalCV", withExtension: "pdf")
        
        if let url = url {
            let webview = UIWebView(frame: self.view.frame)
            let urlRequest = URLRequest(url: url)
            webview.loadRequest(urlRequest)
            view.addSubview(webview)
        }
    }
    
    
    
    
}
