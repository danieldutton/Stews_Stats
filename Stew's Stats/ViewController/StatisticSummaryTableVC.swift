//
//  StatisticSummaryTableVC.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class StatisticSummaryTableVC: UITableViewController {

    private var locationsSection = 5
    
    private var tableViewData: TableSection!

    private var persistance = Persistance.shared


    override func viewDidLoad() {
        super.viewDidLoad()

        addRightEditBarButtonItemToNavBar()
        tableViewData = persistance.retrievePersistedData()
    }

    private func addRightEditBarButtonItemToNavBar() {
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.title.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.labels[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableViewData.title[section]
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == locationsSection {
            let rows = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if rows - 1 == indexPath.row {
                return .insert
            }
        }
        return .none
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.selectionStyle = .none
        
        cell.lblStat.text = self.tableViewData.labels[indexPath.section][indexPath.row]
        cell.lblStat.sizeToFit()
        
        cell.txtFieldStatValue.delegate = self
        cell.txtFieldStatValue.text = self.tableViewData.data[indexPath.section][indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        let tempCell = cell as! TableViewCell
        let text = tempCell.txtFieldStatValue.text!

        //add subscript to properly modelled class and pass an indexPath???
        tableViewData.data[indexPath.section][indexPath.row] = text
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        func addNewLocationRow(_ location: String) {
            tableViewData.labels[locationsSection] += [location]
            tableViewData.data[locationsSection] += ["0"]
            let ct = tableViewData.labels.count
            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: locationsSection)], with: .automatic)
                //prev called reloaddata here
                tableView.reloadRows(at: [IndexPath(row: ct-1, section: locationsSection)], with: .automatic)
            }) { _ in
                tableView.setEditing(true, animated: false)
                self.persistance.persistUserData(tableViewData: self.tableViewData)
            }
        }
        
        if editingStyle == .insert {
            present(inputLocationForm(), animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == locationsSection else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in

            self.tableView.performBatchUpdates({
                self.tableViewData.labels[self.locationsSection].remove(at: indexPath.row)
                self.tableViewData.data[self.locationsSection].remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.persistance.persistUserData(tableViewData: self.tableViewData)
            }) { (_) in
                //self.tableView.reloadData()
                //code to handle if last row in section is deleted
                //consult iOS 12 book
            }
        }
        return UISwipeActionsConfiguration(actions: [contextItem])
    }

    @objc func textChanged(_ sender: Any) {
        let textField = sender as! UITextField
        var responder : UIResponder! = textField
            
        while !(responder is UIAlertController) {
            responder = responder.next
        }
        let alert = responder as! UIAlertController
        alert.actions[1].isEnabled = (textField.text != "")
    }

    private func inputLocationForm() -> UIAlertController {
        func addNewLocationRow(_ location: String) {
            tableViewData.labels[locationsSection].append(location)
            tableViewData.data[locationsSection].append("0")

            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: tableViewData.labels[locationsSection].count - 1, section: locationsSection)], with: .automatic)
                tableView.reloadRows(at: [IndexPath(row: tableViewData.labels[locationsSection].count - 2, section: locationsSection)], with: .automatic)
            }) { _ in
                self.persistance.persistUserData(tableViewData: self.tableViewData)
                self.tableView.scrollToRow(at: IndexPath.init(row: self.tableViewData.labels[self.locationsSection].count - 1, section: self.locationsSection), at: .bottom, animated: true)

                print(#function)
                //self.printTableViewModelValues()
                //self.printPersistanceModelValues()
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
        let cell = getCellTextFieldBelongsTo(textField)
        
        if let sec = self.tableView.indexPath(for: cell)?.section,
            let row = self.tableView.indexPath(for:cell)?.row {
            
            tableViewData.data[sec][row] = cell.txtFieldStatValue.text!
            persistance.persistUserData(tableViewData: self.tableViewData)
        }
    }
    
    private func getCellTextFieldBelongsTo(_ textField: UITextField) -> TableViewCell {
        var v : UIView = textField
        
        repeat {
            v = v.superview!
        } while !(v is UITableViewCell)
        
        return v as! TableViewCell
    }
}

extension StatisticSummaryTableVC {
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == locationsSection && self.tableViewData.labels[locationsSection].count > 1 {
            return true
        }
        return false
    }
    
     override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        tableView.endEditing(true)
        
        if proposedDestinationIndexPath.section != locationsSection {
            return IndexPath(row: 0, section: locationsSection)
        }
        return proposedDestinationIndexPath
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let location = self.tableViewData.labels[locationsSection].remove(at: sourceIndexPath.row)
        let value = self.tableViewData.data[locationsSection].remove(at: sourceIndexPath.row)
        
        self.tableViewData.labels[locationsSection].insert(location, at: destinationIndexPath.row)
        self.tableViewData.data[locationsSection].insert(value, at: destinationIndexPath.row)
        
        persistance.persistUserData(tableViewData: self.tableViewData)

        tableView.reloadData()
    }
}


