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

        tableView.alwaysBounceVertical = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
