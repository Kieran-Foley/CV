//
//  ViewController.swift
//  CV
//
//  Created by Kieran Foley on 25/01/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet var usersName: UITextField!
    @IBOutlet var usersCompany: UITextField!
    @IBOutlet var loginButton: UIButton!
    
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
            databaseRoot = Database.database().reference()
            let users = databaseRoot.child("users")

            // Create a reference to a new value in Firebase.
            let ref = users.childByAutoId()
            let userDetails = ["Name": name, "Company": companyName]
            ref.setValue(userDetails)
            
            // If login is successful.
            performSegue(withIdentifier: "login", sender: self)
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



/* Other UI Designs
 
 ************************************** ************************************** ************************************** **************************************
 /* Changes text fields to just have bottom borders.  */
 
 // Adds the text field delegates to call the dismiss keyboard on return function.
 self.usersCompany.delegate = self
 self.usersName.delegate = self
 
 // Creates bottom borders for textfields.
 let nameBorder = CALayer()
 let companyBorder = CALayer()
 let width = CGFloat(2.0)
 nameBorder.borderColor = UIColor.white.cgColor
 companyBorder.borderColor = UIColor.white.cgColor
 nameBorder.frame = CGRect(x: 0, y: usersName.frame.size.height - width, width:  usersName.frame.size.width, height: usersName.frame.size.height)
 nameBorder.borderWidth = width
 companyBorder.frame = CGRect(x: 0, y: usersCompany.frame.size.height - width, width:  usersCompany.frame.size.width, height: usersCompany.frame.size.height)
 companyBorder.borderWidth = width
 
 // Applies the bottom borders to textfields.
 usersName.layer.addSublayer(nameBorder)
 usersName.layer.masksToBounds = true
 usersCompany.layer.addSublayer(companyBorder)
 usersCompany.layer.masksToBounds = true
 
 
 
 
 
 ************************************** ************************************** ************************************** **************************************
 
 
 //        guard let image = UIImage(named: "blurredBG.jpg") else {
 //            return
 //        }
 //
 //        self.view.backgroundColor = UIColor(patternImage: image)
 */





// Creates bottom borders for textfields.
//        let nameBorder = CALayer()
//        let companyBorder = CALayer()
//        let width = CGFloat(2.0)
//        nameBorder.borderColor = UIColor.white.cgColor
//        companyBorder.borderColor = UIColor.white.cgColor
//        nameBorder.frame = CGRect(x: 0, y: usersName.frame.size.height - width, width:  usersName.frame.size.width, height: usersName.frame.size.height)
//        nameBorder.borderWidth = width
//        companyBorder.frame = CGRect(x: 0, y: usersCompany.frame.size.height - width, width:  usersCompany.frame.size.width, height: usersCompany.frame.size.height)
//        companyBorder.borderWidth = width

// Applies the bottom borders to textfields.
//        usersName.layer.addSublayer(nameBorder)
//        usersName.layer.masksToBounds = true
//        usersCompany.layer.addSublayer(companyBorder)
//        usersCompany.layer.masksToBounds = true
