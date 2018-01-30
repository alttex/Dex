//
//  FakeWalletsViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/28/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class FakeWalletsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Logo_main.png"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(FakeWalletsViewController.callMethod), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 135, height: 35) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func callMethod() {
        print("logo pressed")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
