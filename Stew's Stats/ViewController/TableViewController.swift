//
//  TableViewController.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tableViewData: TableViewData!
    
    var persistance: Persistance!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        persistance = Persistance()
        self.tableViewData = persistance.retrievePersistedData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.section.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableViewData.section[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.items[section].count
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.selectionStyle = .none
        
        cell.lblStat.text = self.tableViewData.items[indexPath.section][indexPath.row]
        cell.lblStat.sizeToFit()
        
        cell.txtFieldStatValue.delegate = self
        cell.txtFieldStatValue.text = self.tableViewData.data[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension TableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // some cell's text field has finished editing; which cell?
        var v : UIView = textField
        //
        repeat { v = v.superview! } while !(v is UITableViewCell)
        //
        let cell = v as! TableViewCell
        //what section is that
        //this sometimes throws an error and if it does, the model isn't updated
        let sec = self.tableView.indexPath(for: cell)!.section
        // what row is that?
        let ip = self.tableView.indexPath(for:cell)!.row
        // update data model to match
        self.tableViewData.data[sec][ip] = cell.txtFieldStatValue.text!
        
        print(#function)
        persistance.persistUserData(tableViewData: self.tableViewData)
    }
}
