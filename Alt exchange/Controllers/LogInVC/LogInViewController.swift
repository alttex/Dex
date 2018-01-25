//
//  LogInViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/23/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import UIKit
import TextFieldEffects


class LoginViewController : UIViewController {
    
    
    @IBOutlet weak var emailTextField: YokoTextField!
    @IBOutlet weak var passTextField: YokoTextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBAction func logInButton(_ sender: Any) {
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        
        if emailTextField.isSelected == true {
            emailTextField.placeholder = ""
            emailTextField.text = nil
        }
        else if passTextField.isSelected == true {
            passTextField.placeholder = ""
            passTextField.text = nil
        }
        
        
       
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        self.passTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
    }
    
    
}
