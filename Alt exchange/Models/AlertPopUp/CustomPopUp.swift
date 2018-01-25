//
//  CustomPopUp.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/25/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import UIKit

class CustomPopUp: UIView,Modal {
    
    var backgroundView = UIView()
    var dialogView = UIView()
    
    convenience init(title:String, image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
        let dialogViewWidth = frame.width-64
        
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: dialogViewWidth-16, height: 30))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        dialogView.addSubview(titleLabel)
        let separatorLineView = UIView()
        separatorLineView.frame.origin = CGPoint(x: 0, y: titleLabel.frame.height + 8)
        separatorLineView.frame.size = CGSize(width: dialogViewWidth, height: 1)
        separatorLineView.backgroundColor = UIColor.groupTableViewBackground
        dialogView.addSubview(separatorLineView)
        let imageView = UIImageView()
        imageView.frame.origin = CGPoint(x: 8, y: separatorLineView.frame.height + separatorLineView.frame.origin.y + 8)
        imageView.frame.size = CGSize(width: dialogViewWidth - 16 , height: dialogViewWidth - 16)
        imageView.image = image
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        dialogView.addSubview(imageView)
        let dialogViewHeight = titleLabel.frame.height + 8 + separatorLineView.frame.height + 8 + imageView.frame.height + 8
        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: frame.width-64, height: dialogViewHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        dialogView.clipsToBounds = true
        dialogView.layoutIfNeeded()
        addSubview(dialogView)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.layoutIfNeeded()
        addSubview(backgroundView)
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
}
