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



class LoginViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.authenticationCompletionHandler(loginStatusNotification:)), name: .MTBiometricAuthenticationNotificationLoginStatus, object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    
    @IBAction func bioMetricLoginSubmitted(_ sender: Any) {

        authenticateWithBiometric()
        
    
    }
    
    
    @objc func authenticationCompletionHandler(loginStatusNotification: Notification) {
        if let _ = loginStatusNotification.object as? MTBiometricAuthentication, let userInfo = loginStatusNotification.userInfo {
            if let authStatus = userInfo[MTBiometricAuthentication.status] as? MTBiomericAuthenticationStatus {
                if authStatus.success {
                    print("Login Success")
                    DispatchQueue.main.async {
                        self.onLoginSuccess()
                    }
                } else {
                    if let errorCode = authStatus.errorCode {
                        print("Login Fail with code \(String(describing: errorCode)) reason \(authStatus.errorMessage)")
                        DispatchQueue.main.async {
                            self.onLoginFail()
                        }
                        
                    }
                }
            }
        }
    }
    
    func onLoginSuccess() {
        let mainStoryboard = UIStoryboard.init(name: "MainTabs", bundle: nil)
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: "TabsVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func onLoginFail() {
        let alert = UIAlertController(title: "Login", message: "Login Failed", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func authenticateWithBiometric() {
        let bioAuth = MTBiometricAuthentication()
        bioAuth.reasonString = "To login into the app"
        bioAuth.authenticationWithBiometricID()
    }
    
}

