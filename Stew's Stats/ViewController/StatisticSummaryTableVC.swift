//
//  StatisticSummaryTableVC.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class StatisticSummaryTableVC: UITableViewController {

    private var tableViewData: TableViewData!

    private var persistance = Persistance.shared

    //
    override func viewDidLoad() {
        super.viewDidLoad()

        addRightEditBarButtonItemToNavBar()
        tableViewData = persistance.retrievePersistedData()
        
        printSavedLocationDetails()
    }
    
    func printSavedLocationDetails() {
        let items = self.persistance.retrievePersistedData().items
        let data =  self.persistance.retrievePersistedData().data
        print(items)
        print(data)
    }
    
    //
    private func addRightEditBarButtonItemToNavBar() {
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.section.count
    }

    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.items[section].count
    }
    
    //
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableViewData.section[section]
    }

    //
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 5 {
            let rows = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if rows - 1 == indexPath.row {
                return .insert
            }
        }
        return .none
    }

    //
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
        //deleting other rows fine. Deleting last row crashes

        //row is one ahead on delete and causing a crash
        tableViewData.data[indexPath.section][indexPath.row] = text
    }
    
    //
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        func addNewLocationRow(_ location: String) {
            let sectionNo = 5
            tableViewData.items[5] += [location]
            tableViewData.data[5] += ["0"]
            let ct = tableViewData.items.count
            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: sectionNo)], with: .automatic)
                //prev called reloaddata here
                tableView.reloadRows(at: [IndexPath(row: ct-1, section: sectionNo)], with: .automatic)
            }) { _ in
                tableView.setEditing(true, animated: false)
                self.persistance.persistUserData(tableViewData: self.tableViewData)
            }
        }
        
        if editingStyle == .insert {
            present(inputLocationForm(), animated: true)
        }
    }
    
    //
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == 5 else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.tableViewData.removeLocation(at: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.persistance.persistUserData(tableViewData: self.tableViewData)
            //self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: .top)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }

    //
    @objc func textChanged(_ sender: Any) {
        let textField = sender as! UITextField
        var responder : UIResponder! = textField
            
        while !(responder is UIAlertController) {
            responder = responder.next
        }
        let alert = responder as! UIAlertController
        alert.actions[1].isEnabled = (textField.text != "")
    }
    
    //
    private func inputLocationForm() -> UIAlertController {
        func addNewLocationRow(_ location: String) {
            tableViewData.items[5].append(location)
            tableViewData.data[5].append("0")
            
            //tableView.beginUpdates()

            //tableView.endUpdates()
            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: tableViewData.items[5].count - 1, section: 5)], with: .automatic)
                tableView.reloadRows(at: [IndexPath(row: tableViewData.items[5].count - 2, section: 5)], with: .automatic)
            }) { _ in
                self.persistance.persistUserData(tableViewData: self.tableViewData)
                self.printSavedLocationDetails()
            }
        }
        
        let alertCon = UIAlertController(title: "Add New Location", message: nil, preferredStyle: .alert)
        alertCon.addTextField { txtField in
            txtField.keyboardType = .alphabet
            txtField.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { action in
            let tf = alertCon.textFields![0]

            addNewLocationRow(tf.text!)
            
            //line next not working properly
            //self.tableView.setEditing(false, animated: true)
            //can read tf text here
        }

        alertCon.addAction(cancelAction)
        alertCon.addAction(confirmAction)
        alertCon.actions[1].isEnabled = false
        alertCon.preferredAction = alertCon.actions[1]
        
        return alertCon
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
            
            tableViewData.data[sec][row] = cell.txtFieldStatValue.text!
            persistance.persistUserData(tableViewData: self.tableViewData)
        }
    }
}



