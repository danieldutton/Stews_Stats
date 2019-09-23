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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //first force our textfield to cease editing
        tableView.endEditing(true)
        if editingStyle == .insert {
            let alertCon = UIAlertController(title: "Add New Location", message: nil, preferredStyle: .alert)
            alertCon.addTextField { tf in
                tf.keyboardType = .alphabet
                tf.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
                let tf = alertCon.textFields![0]
                print(tf.text!)
                //can read tf text here
            }
            
            /*
            func handler(_ action: UIAlertAction) {
                let tf = alertCon.textFields![0]
                print(tf.text!)
                //can read tf text here
            }
            */
            
            alertCon.addAction(cancelAction)
            alertCon.addAction(confirmAction)
            alertCon.actions[1].isEnabled = false
            alertCon.preferredAction = alertCon.actions[1]
            
            present(alertCon, animated: true)
            
            /*
            let sectionNo = 5
            tableViewData.items[5] += ["New Location"]
            tableViewData.data[5] += ["0"]
            let ct = tableViewData.items.count
            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: sectionNo)], with: .automatic)
                tableView.reloadData()
                //tableView.reloadRows(at: [IndexPath(row: ct-2, section: sectionNo)], with: .automatic)
            }) { _ in
                let cell = tableView.cellForRow(at: IndexPath(row: ct-1, section: sectionNo))
                (cell as! TableViewCell).txtFieldStatValue.becomeFirstResponder()
            }
            */
        }
        
    }
    
    @objc func textChanged(_ sender: Any) {
            let tf = sender as! UITextField
            var resp : UIResponder! = tf
            while !(resp is UIAlertController) { resp = resp.next }
            let alert = resp as! UIAlertController
            alert.actions[1].isEnabled = (tf.text != "")
    }
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
