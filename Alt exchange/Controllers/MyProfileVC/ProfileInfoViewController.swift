//
//  ProfileInfoViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/24/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tableArray = ["Tranding wallets","Privat wallets", "Margin wallet"]
    var buttonImageArr = ["PlusBtn","PlusBtn","info"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Logo_main.png"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(FakeWalletsViewController.callMethod), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 135, height: 35) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        tableView.alwaysBounceVertical = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func callMethod() {
        print("logo pressed")
    }
    

}

extension ProfileInfoViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileInfoCell") as! ProfileInfoTableViewCell
        cell.profileCellWallets.text = tableArray[indexPath.row]
        cell.optionBtn.setBackgroundImage(UIImage(named: buttonImageArr[indexPath.row]), for: .normal)
        
        return cell
    }
   
    
    
}
