//
//  HistoryViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/24/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Logo_main.png"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(FakeWalletsViewController.callMethod), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 135, height: 35) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
     self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        
    }
    
    
    
    @objc func callMethod() {
        print("logo pressed")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
   
    
}


extension HistoryViewController: UITableViewDataSource,UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")
        
        return cell!
    }
   
    
    
    
}
