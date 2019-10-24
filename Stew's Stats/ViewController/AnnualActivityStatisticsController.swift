import UIKit

class AnnualActivityStatisticsController: BaseActivityStatisticsController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //deal with try
        try! self.statistics = statisticsRepo.getStatistics(.annual)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnnualActivityStatisticsCell

        cell.txtFieldAnnualActivities.delegate = self
        cell.txtFieldAnnualMiles.delegate = self
        
        cell.txtFieldAnnualActivities.text = self.statistics.sections[indexPath.section].rows[indexPath.row].stat1
        cell.txtFieldAnnualMiles.text = self.statistics.sections[indexPath.section].rows[indexPath.row].stat2
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }

        let tempCell = cell as! AnnualActivityStatisticsCell
        let txtActivities = tempCell.txtFieldAnnualActivities.text!
        let txtMiles = tempCell.txtFieldAnnualMiles.text!

        //add subscript to properly modelled class and pass an indexPath???
        self.statistics.sections[indexPath.section].rows[indexPath.row].stat1 = txtActivities
        self.statistics.sections[indexPath.section].rows[indexPath.row].stat2 = txtMiles
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.endEditing(true)
        
        if editingStyle == .insert {
            let lastSection = self.statistics.sections.count - 1
            let lastYear = Int(self.statistics.sections[lastSection].name)!
            let nextYear = lastYear + 1
            print(lastSection)
            self.statistics.sections.append(Section(name: "\(nextYear)", rows: [
                Row(stat1: "0", stat2: "0")
            ]))
            let indexSet = IndexSet(integer: statistics.sections.count - 1)
            
            //consider insert sections
            //use performbatchupdates
            tableView.insertSections(indexSet, with: .automatic)
            //deal with the try
            try! statisticsRepo.save(statistics: self.statistics)
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
                try! self.statisticsRepo.save(statistics: self.statistics)
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
        
        if let indexPath = indexPathIsValidFor(cell: cell) {
            self.statistics.sections[indexPath.section].rows[indexPath.row].stat1 = cell.txtFieldAnnualActivities.text!
            self.statistics.sections[indexPath.section].rows[indexPath.row].stat2 = cell.txtFieldAnnualMiles.text!

            //deal with the try!
            try! statisticsRepo.save(statistics: self.statistics)
        }
    }
}
 
