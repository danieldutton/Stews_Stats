//
//  StatisticSummaryTableVC.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

//When Pulling up to a superclass, consult refactoring book

class StatisticSummaryTableVC: UITableViewController {

    private var locationsSection = 5

    private var sections: [Section]!
    
    private var seedData: SeedData!

    private var persistance = Persistance.shared


    override func viewDidLoad() {
        super.viewDidLoad()
        seedData = StewsRuntasticData()
        //self.sections = DataModelSeeder().getDataModel()
        addRightEditBarButtonItemToNavBar()
        sections = persistance.retrievePersistedData(.one)
        //persistance.persistUserData(tableViewData: self.sections, with: .one)
    }

    private func addRightEditBarButtonItemToNavBar() {
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].values.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].sectionName
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DailyStatisticCell
        
        cell.selectionStyle = .none

        cell.lblStat.text = self.sections[indexPath.section].values[indexPath.row].statName
        cell.lblStat.sizeToFit()
        
        cell.txtFieldStatValue.delegate = self
        cell.txtFieldStatValue.text = self.sections[indexPath.section].values[indexPath.row].statValue
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        let tempCell = cell as! DailyStatisticCell
        let text = tempCell.txtFieldStatValue.text!

        //add subscript to properly modelled class and pass an indexPath???
        self.sections[indexPath.section].values[indexPath.row].statValue = text
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        func addNewLocationRow(_ location: String) {
            //indexPath.section was prev hardcoded 5
            self.sections[indexPath.section].values[indexPath.row].statName = location
            self.sections[indexPath.section].values[indexPath.row].statValue = "0"
            let ct = sections[indexPath.section].values.count

            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: locationsSection)], with: .automatic)
                //prev called reloaddata here
                tableView.reloadRows(at: [IndexPath(row: ct-1, section: locationsSection)], with: .automatic)
            }) { _ in
                tableView.setEditing(true, animated: false)
                self.persistance.persistUserData(tableViewData: self.sections, with: .one)
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
                self.sections[indexPath.section].values.remove(at: indexPath.row)

                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.persistance.persistUserData(tableViewData: self.sections, with: .one)
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
            self.sections[5].values.append(Row(statName: location, statValue: "0"))

            tableView.performBatchUpdates({
                let indexPathInsert = IndexPath(row: sections[5].values.count - 1, section: 5)
                tableView.insertRows(at: [indexPathInsert], with: .automatic)
                let indexPathReload = IndexPath(row: sections[5].values.count - 2, section: 5)
                tableView.reloadRows(at: [indexPathReload], with: .automatic)
            }) { _ in
                self.persistance.persistUserData(tableViewData: self.sections, with: .one)
                let indexPathScrollTo = IndexPath(row: self.sections[5].values.count - 1, section: 5)
                self.tableView.scrollToRow(at: indexPathScrollTo, at: .bottom, animated: true)
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
            
            self.sections[sec].values[row].statValue = cell.txtFieldStatValue.text!

            persistance.persistUserData(tableViewData: self.sections, with: .one)
        }
    }
    
    private func getCellTextFieldBelongsTo(_ textField: UITextField) -> DailyStatisticCell {
        var v : UIView = textField
        
        repeat {
            v = v.superview!
        } while !(v is UITableViewCell)
        
        return v as! DailyStatisticCell
    }
}

extension StatisticSummaryTableVC {
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 5 && self.sections[indexPath.section].values.count > 1 {
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
        let locationRow = self.sections[5].values.remove(at: sourceIndexPath.row)
        self.sections[5].values.insert(locationRow, at: destinationIndexPath.row)

        persistance.persistUserData(tableViewData: self.sections, with: .one)

        tableView.reloadData()
    }
}


