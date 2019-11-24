import UIKit

//if you delete a section first before adding, the plus button has gone to add a new section

class AnnualActivityStatisticsController: BaseActivityStatisticsController {

    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveSavedStatistics(key: .annual)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellAnnualStat

        cell.txtFieldAnnualActivities.delegate = self
        cell.txtFieldAnnualMiles.delegate = self

        cell.txtFieldAnnualActivities.text = statistics[indexPath]?.stat1
        cell.txtFieldAnnualMiles.text = statistics[indexPath]?.stat2
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }
        statistics[indexPath] = (cell as! TableViewCellAnnualStat).asRow
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        if editingStyle == .insert {
            self.statistics.sections.append(TableViewSection(name: "\(titleForNewYear())", rows: [
                TableViewRow(stat1: "0", stat2: "0")
            ]))
            let indexSet = IndexSet(integer: statistics.sections.count - 1)
            tableView.insertSections(indexSet, with: .automatic)

            saveCurrentStatistics()
        }
    }
    
    func titleForNewYear() -> String {
        let lastSection = statistics.lastSectionIndex
        let lastYear = Int(statistics.sections[lastSection].name)!
        let nextYear = lastYear + 1
        
        return "\(nextYear)"
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == self.statistics.sections.count - 1 else {
            return UISwipeActionsConfiguration(actions: [])
        }
        
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            self.tableView.performBatchUpdates({
                guard self.statistics.sections.count > 1 else {
                    return
                }
                self.statistics.sections.remove(at: indexPath.section)

                let indexSet = IndexSet(arrayLiteral: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
                
                self.saveCurrentStatistics()
            }) { (_) in
            }
        }
        return UISwipeActionsConfiguration(actions: [contextItem])
    }
}

extension AnnualActivityStatisticsController {

    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell: TableViewCellAnnualStat = getCellTextFieldBelongsTo(textField)
        
        if let indexPath = tableView.hasValidIndexPathFor(cell: cell) {
            self.statistics[indexPath] = cell.asRow

            saveCurrentStatistics()
        }
    }
}
 
