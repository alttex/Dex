//
//  SettingsTableViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/24/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
     var settingsArray = ["Profile settings", "Wallet settings", "Card settings", "PIN & Password","Sequrity"]
    
    var passedValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as! SettingsTableViewCell
        cell.settingsNameLbl?.text = settingsArray[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as! SettingsTableViewCell
        
        passedValue = currentCell.textLabel?.text
        performSegue(withIdentifier: "toCardSettings", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toCardSettings") {
            
//            let vc = segue.destination as! CardInfoViewController
//            vc.title = "Settings bleat"
        }
    }


}
