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

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redraw()
    }
    
    func redraw() {
        
        guard let image = UIImage(named: "blurredBG.jpg") else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        button.layer.cornerRadius = 45
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.cyan
        testView.backgroundColor = UIColor.cyan

        
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("Pressed")
    }
}
