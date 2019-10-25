import UIKit

class AnnualActivityStatisticsController: BaseActivityStatisticsController {

    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveSavedStatistics(key: .annual)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnnualActivityStatisticsCell

        cell.txtFieldAnnualActivities.delegate = self
        cell.txtFieldAnnualMiles.delegate = self
        
        let row = statistics[indexPath]
        cell.txtFieldAnnualActivities.text = row?.stat1
        cell.txtFieldAnnualMiles.text = row?.stat2
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        //consider using inner functions for tidyness
        
        let tempCell = cell as! AnnualActivityStatisticsCell
        let txtActivities = tempCell.txtFieldAnnualActivities.text!
        let txtMiles = tempCell.txtFieldAnnualMiles.text!

        let updatedRow = Row(stat1: txtActivities, stat2: txtMiles)
        statistics[indexPath] = updatedRow
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        if editingStyle == .insert {
            let lastSection = self.statistics.sections.count - 1
            let lastYear = Int(self.statistics.sections[lastSection].name)!
            let nextYear = lastYear + 1

            self.statistics.sections.append(Section(name: "\(nextYear)", rows: [
                Row(stat1: "0", stat2: "0")
            ]))
            let indexSet = IndexSet(integer: statistics.sections.count - 1)
            
            //consider insert sections
            //use performbatchupdates
            tableView.insertSections(indexSet, with: .automatic)

            saveCurrentStatistics()
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == self.statistics.sections.count - 1 else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            self.tableView.performBatchUpdates({
                //need to remove the section
                self.statistics.sections[indexPath.section].rows.remove(at: indexPath.row)

                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.saveCurrentStatistics()
            }) { (_) in
                //self.tableView.reloadData()
                //code to handle if last row in section is deleted
                //consult iOS 12 book
            }
        }
        return UISwipeActionsConfiguration(actions: [contextItem])
    }
}

extension AnnualActivityStatisticsController {

    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell: AnnualActivityStatisticsCell = getCellTextFieldBelongsTo(textField)
        
        if let indexPath = tableView.hasValidIndexPathFor(cell: cell) {
            self.statistics[indexPath] = Row(
                stat1: cell.txtFieldAnnualActivities.text!,
                stat2: cell.txtFieldAnnualMiles.text!
            )
            //shouldnt save be performed by calling the repository
            //as as soon as we save, we update
            saveCurrentStatistics()
        }
    }
}
 
