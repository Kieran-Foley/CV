//
//  ViewController.swift
//  CV
//
//  Created by Kieran Foley on 25/01/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import KMFButtons
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet var pageTitle: UILabel!
    @IBOutlet var usersNameLabel: UILabel!
    @IBOutlet var usersName: UITextField!
    @IBOutlet var usersCompanyLabel: UILabel!
    @IBOutlet var usersCompany: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redraw()
        
        // Adds the text field delegates to call the dismiss keyboard on return function.
        self.usersCompany.delegate = self
        self.usersName.delegate = self
        
        // Allows user to close the keyboard by tapping anywhere else on the screen.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func redraw() {
        buttonDesign(button: loginButton)

        guard let image = UIImage(named: "blurredBG.jpg") else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        pageTitle.text = "Welcome!\nI'm Kieran\nIt's Nice to meet you!"
        usersNameLabel.text = "Name"
        usersNameLabel.textColor = UIColor.white
        usersName.placeholder = "..."
        usersCompanyLabel.text = "Company name"
        usersCompanyLabel.textColor = UIColor.white
        usersCompany.placeholder = "..."
    }
    
    @IBAction func nextButtonPushed(_ sender: Any) {
        if usersName.text == "" {
            
            let alert = UIAlertController(title: "Oops!", message: "Please enter your name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
            
        } else if usersCompany.text == "" {
            let alert = UIAlertController(title: "Oops!", message: "Please enter your company name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        } else {
            // Store name and company name to Firebase.
            // Stops optional chaining apply to usersname and company name before firebase implemtantion.
            guard let name = usersName.text, let companyName = usersCompany.text else {
                return
            }
            
            ref = Database.database().reference()
            
            self.ref.child("users").setValue(name)
            self.ref.child("Company").setValue(companyName)

            
            
            
            
            // If login is successful.
            performSegue(withIdentifier: "login", sender: self)
            
        }
    }
    
    
    // Function to design the button.
    func buttonDesign(button:UIButton) {
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.green
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    // Function to dismiss keyboard when the user taps anywhere on screen.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Dismiss the keyboard on return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
}

