//
//  DetailViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/23/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var currency: Currency?
    
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buyBtn.layer.cornerRadius = 15
        if let currency = currency {
            title = currency.Symbol
            if let icon = UIImage(named: currency.Symbol) {
                iconImageView.image = icon
                iconImageView.alpha = 1
            } else {
                iconImageView.image = UIImage(named: "BTC")
                iconImageView.alpha = 0.5
            }
            nameLabel.text = currency.Name
        }
        
    }
    
}
