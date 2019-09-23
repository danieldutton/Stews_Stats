//
//  StatisticSummaryTableVC.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class StatisticSummaryTableVC: UITableViewController {

    var tableViewData: TableViewData!
    
    var persistance: Persistance!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        persistance = Persistance()
        self.tableViewData = persistance.retrievePersistedData()
    }

    //Tests Complete
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.section.count
    }
    
    //Tests Complete
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.items[section].count
    }
    
    //Tests Complete
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableViewData.section[section]
    }

    //Complete
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 5 {
            let rows = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if rows - 1 == indexPath.row {
                return .insert
            }
        }
        return .none
    }
    
    //Completed
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.selectionStyle = .none
        
        cell.lblStat.text = self.tableViewData.items[indexPath.section][indexPath.row]
        cell.lblStat.sizeToFit()
        
        cell.txtFieldStatValue.delegate = self
        cell.txtFieldStatValue.text = self.tableViewData.data[indexPath.section][indexPath.row]

        return cell
    }
    
    //
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tempCell = cell as! TableViewCell
        
        let text = tempCell.txtFieldStatValue.text!
        tableViewData.data[indexPath.section][indexPath.row] = text
    }
    
    //Complete
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //insertion
    
}

extension StatisticSummaryTableVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // some cell's text field has finished editing; which cell?
        var v : UIView = textField
        //
        repeat {
            v = v.superview!
        } while !(v is UITableViewCell)
        
        let cell = v as! TableViewCell
        
        if let sec = self.tableView.indexPath(for: cell)?.section,
            let row = self.tableView.indexPath(for:cell)?.row {
            
            self.tableViewData.data[sec][row] = cell.txtFieldStatValue.text!
            persistance.persistUserData(tableViewData: self.tableViewData)
        }
    }
}
