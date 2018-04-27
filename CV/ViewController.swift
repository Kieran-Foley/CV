//
//  ViewController.swift
//  CV
//
//  Created by Kieran Foley on 25/01/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import Firebase

var nameGlobal:String = ""

class ViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet var usersName: UITextField!
    @IBOutlet var usersCompany: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var logo: UIImageView!
    
    // Declarations
    var databaseRoot: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        redraw()
        // Adds the text field delegates to call the dismiss keyboard on return function.
        self.usersCompany.delegate = self
        self.usersName.delegate = self
        
        // Adds the text field delegates to call the dismiss keyboard on return function.
        self.usersCompany.delegate = self
        self.usersName.delegate = self
                
        // Allows user to close the keyboard by tapping anywhere else on the screen.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /* Animations */
        // Logo 'Pulsing' animation
        UIView.animate(withDuration: 1.5, animations: {
            self.logo.frame = CGRect(x: 125, y: 58, width: 125, height: 125)
        }) { _ in
            UIView.animate(withDuration: 1.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.logo.frame = CGRect(x: 112, y: 45, width: 150, height: 150)
            })
        }
    }
    
    // Placeholder text & button attributes
    func redraw() {
        buttonDesign(button: loginButton)
        usersName.attributedPlaceholder = NSAttributedString(string: "Name...", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
        usersCompany.attributedPlaceholder = NSAttributedString(string: "Company...", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
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
            guard let name = usersName.text, let companyName = usersCompany.text else {
                return
            }
            
            // Stores users name in global variable.
            nameGlobal = name
            databaseRoot = Database.database().reference()
            let users = databaseRoot.child("users")

            // Create a reference to a new value in Firebase.
            let ref = users.childByAutoId()
            let userDetails = ["Name": name, "Company": companyName]
            ref.setValue(userDetails)
            
            // If login is successful.
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "3")
            self.present(newViewController, animated: false, completion: nil)
        }
    }
    
    // Function to design the button.
    func buttonDesign(button:UIButton) {
        button.setTitle("Next", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 2
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
