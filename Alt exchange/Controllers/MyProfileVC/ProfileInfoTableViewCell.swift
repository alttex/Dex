//
//  ProfileInfoTableViewCell.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/24/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var profileCellWallets: UILabel!
    
    @IBOutlet weak var optionBtn: UIButton!

    @IBAction func optionBtnClicked(_ sender: Any) {
      
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBtn)))
        print("WTF?!")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
     optionBtn.layer.cornerRadius = 15
    }

    @objc func didTappedOnBtn(){
        let alert = CustomPopUp(title: "Info about you profile", image: UIImage(named: "sample")!)
        alert.show(animated: true)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
