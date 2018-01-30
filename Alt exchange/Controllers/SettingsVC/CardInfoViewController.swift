//
//  SettingsViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/17/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit
import Stripe
import CreditCardForm

class CardInfoViewController: UIViewController,STPPaymentCardTextFieldDelegate {

    @IBOutlet weak var sendPaymentBtn: UIButton!
    @IBAction func cancelBtnDidTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var creditCardView: CreditCardFormView!
    let paymentTextField = STPPaymentCardTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Logo_main.png"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(FakeWalletsViewController.callMethod), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 135, height: 35) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        self.sendPaymentBtn.layer.cornerRadius = 15
        creditCardView.cardHolderString = "Ivan Ivanov"
        createTextField()
    }
    
    @objc func callMethod() {
        print("logo pressed")
    }
    
    func createTextField() {
        paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width, height: 34)
        paymentTextField.delegate = self
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)
        
        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: creditCardView.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        creditCardView.paymentCardTextFieldDidEndEditingCVC()
    }
}
