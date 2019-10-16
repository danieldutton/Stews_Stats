//
//  DailyActivityStatisticsController.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class DailyActivityStatisticsController: BaseActivityStatisticsController {

    override func viewDidLoad() {
        super.viewDidLoad()

        seedTableViewIfEmpty(.dailySummary, seedData: AnnualActivityStatisticsSeedData())
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DailyActivityStatisticsCell

        cell.lblStat.text = sections[indexPath.section].rows[indexPath.row].stat1
        cell.lblStat.sizeToFit()
        
        cell.txtFieldStatValue.delegate = self
        cell.txtFieldStatValue.text = sections[indexPath.section].rows[indexPath.row].stat2
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        let tempCell = cell as! DailyActivityStatisticsCell
        let text = tempCell.txtFieldStatValue.text!

        //add subscript to properly modelled class and pass an indexPath???
        self.sections[indexPath.section].rows[indexPath.row].stat2 = text
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        func addNewLocationRow(_ location: String) {
            //indexPath.section was prev hardcoded 5
            self.sections[indexPath.section].rows[indexPath.row].stat1 = location
            self.sections[indexPath.section].rows[indexPath.row].stat2 = "0"
            let ct = sections[indexPath.section].rows.count

            tableView.performBatchUpdates({
                tableView.insertRows(at: [IndexPath(row: ct-1, section: sections.count - 1)], with: .automatic)
                tableView.reloadRows(at: [IndexPath(row: ct-1, section: sections.count - 1)], with: .automatic)
            }) { _ in
                tableView.setEditing(true, animated: false)
                self.persistance.persistUserData(tableViewData: self.sections, with: .dailySummary)
            }
        }
        
        if editingStyle == .insert {
            present(inputLocationForm(), animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == sections.count - 1 else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in

            self.tableView.performBatchUpdates({
                self.sections[indexPath.section].rows.remove(at: indexPath.row)

                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.persistance.persistUserData(tableViewData: self.sections, with: .dailySummary)
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
            self.sections[5].rows.append(Row(stat1: location, stat2: "0"))

            tableView.performBatchUpdates({
                let indexPathInsert = IndexPath(row: sections[5].rows.count - 1, section: 5)
                tableView.insertRows(at: [indexPathInsert], with: .automatic)
                let indexPathReload = IndexPath(row: sections[5].rows.count - 2, section: 5)
                tableView.reloadRows(at: [indexPathReload], with: .automatic)
            }) { _ in
                self.persistance.persistUserData(tableViewData: self.sections, with: .dailySummary)
                let indexPathScrollTo = IndexPath(row: self.sections[5].rows.count - 1, section: 5)
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

extension DailyActivityStatisticsController {

    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell: DailyActivityStatisticsCell = getCellTextFieldBelongsTo(textField)
        
        if let indexPath = indexPathIsValidFor(cell: cell) {
            self.sections[indexPath.section].rows[indexPath.row].stat2 = cell.txtFieldStatValue.text!

            persistance.persistUserData(tableViewData: self.sections, with: .dailySummary)
        }
    }
}

extension DailyActivityStatisticsController {
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == sections.count - 1 && self.sections[indexPath.section].rows.count > 1 {
            return true
        }
        return false
    }
    
     override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        tableView.endEditing(true)
        
        if proposedDestinationIndexPath.section != sections.count - 1 {
            return IndexPath(row: 0, section: sections.count - 1)
        }
        return proposedDestinationIndexPath
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let locationRow = sections[5].rows.remove(at: sourceIndexPath.row)
        sections[5].rows.insert(locationRow, at: destinationIndexPath.row)

        persistance.persistUserData(tableViewData: sections, with: .dailySummary)

        tableView.reloadData()
    }
}



