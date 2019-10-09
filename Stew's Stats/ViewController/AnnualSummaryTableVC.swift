//
//  AnnualSummaryTableVC.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 29/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class AnnualSummaryTableVC: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //consider using factory
        seedTableViewIfEmpty(.annualSummary, seedData: StewsAnnualData())
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnnualStatisticCell
        
        cell.selectionStyle = .none

        cell.txtFieldAnnualActivities.delegate = self
        cell.txtFieldAnnualMiles.delegate = self
        
        cell.txtFieldAnnualActivities.text = self.sections[indexPath.section].rows[indexPath.row].statName
        cell.txtFieldAnnualMiles.text = self.sections[indexPath.section].rows[indexPath.row].statValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        let tempCell = cell as! AnnualStatisticCell
        let txtActivities = tempCell.txtFieldAnnualActivities.text!
        let txtMiles = tempCell.txtFieldAnnualMiles.text!

        //add subscript to properly modelled class and pass an indexPath???
        self.sections[indexPath.section].rows[indexPath.row].statName = txtActivities
        self.sections[indexPath.section].rows[indexPath.row].statValue = txtMiles
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        if editingStyle == .insert {
            let lastSection = self.sections.count - 1
            let lastYear = Int(self.sections[lastSection].name)!
            let nextYear = lastYear + 1
            print(lastSection)
            self.sections.append(Section(name: "\(nextYear)", rows: [
                Row(statName: "0", statValue: "0")
            ]))
            let indexSet = IndexSet(integer: sections.count - 1)
            
            //consider insert sections
            //use performbatchupdates
            tableView.insertSections(indexSet, with: .automatic)
            persistance.persistUserData(tableViewData: self.sections, with: .annualSummary)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == self.sections.count - 1 else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            self.tableView.performBatchUpdates({
                //need to remove the section
                self.sections[indexPath.section].rows.remove(at: indexPath.row)

                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.persistance.persistUserData(tableViewData: self.sections, with: .annualSummary)
            }) { (_) in
                //self.tableView.reloadData()
                //code to handle if last row in section is deleted
                //consult iOS 12 book
            }
        }
        return UISwipeActionsConfiguration(actions: [contextItem])
    }
}


extension AnnualSummaryTableVC: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = getCellTextFieldBelongsTo(textField)
        
        if let sec = self.tableView.indexPath(for: cell)?.section,
            let row = self.tableView.indexPath(for:cell)?.row {
            
            self.sections[sec].rows[row].statName = cell.txtFieldAnnualActivities.text!
            self.sections[sec].rows[row].statValue = cell.txtFieldAnnualMiles.text!

            persistance.persistUserData(tableViewData: self.sections, with: .annualSummary)
        }
    }
    
    //use some generic magic here
    private func getCellTextFieldBelongsTo(_ textField: UITextField) -> AnnualStatisticCell {
        var v : UIView = textField
        
        repeat {
            v = v.superview!
        } while !(v is UITableViewCell)
        
        return v as! AnnualStatisticCell
    }
}
 
