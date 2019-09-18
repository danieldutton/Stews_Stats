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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        retrievePersistedData()
    }
    
    private func retrievePersistedData() {
        if let savedData = UserDefaults.standard.data(forKey: "tableViewData") {
            let data = try? JSONDecoder().decode(TableViewData.self, from: savedData)
            self.tableViewData = data
            print(data)
        } else {
            self.tableViewData = TableViewData()
        }
    }
    
    private func persistUserData() {
        if let encoded = try? JSONEncoder().encode(self.tableViewData) {
            UserDefaults.standard.set(encoded, forKey: "tableViewData")
        } else {
            //display try again error message
        }
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
        /*
        if indexPath.section == 5 {
            let ct = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            
            if ct - 1 == indexPath.row {
                return .insert
            }
            //return .delete
        }
        */
        return .none
    }
    
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        /*
        if editingStyle == .insert {
            self.tableViewData.items[0] += ["New Location"]
            let ct = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: 1)], with: .automatic)
                tableView.reloadRows(at: [IndexPath(row: ct-2, section: 1)], with: .automatic)
            }) { (_) in
                let cell = self.tableView.cellForRow(at: IndexPath(row: ct-1, section: 1))
                //(cell as! TableViewCell).txtFieldStatValue.becomeFirstResponder()
            }
        }
    */
    }
    */
 
    /*
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let s = self.tableViewData.data.remove(at:fromIndexPath.row)
        self.tableViewData.data.insert(s, at:toIndexPath.row)
        persistUserData()
        tableView.reloadData()
    }
    */
 
    /*
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 5  {
            return true
        }
        return false
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        tableView.endEditing(true)
        if proposedDestinationIndexPath.section == 0 || proposedDestinationIndexPath.section == 1
        || proposedDestinationIndexPath.section == 2 || proposedDestinationIndexPath.section == 3
            || proposedDestinationIndexPath.section == 4 {
            return IndexPath(row: 0, section: 5)
        }
        return proposedDestinationIndexPath
    }
    */
 
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
        print(#function)
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
        persistUserData()
    }
}
