//
//  RechangeTableViewCell.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/25/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class RechangeTableViewCell: UITableViewCell {

    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        buyBtn.layer.cornerRadius = 14
        sellBtn.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
