import UIKit

class BaseActivityStatisticsController: UITableViewController {
    
    //this should really be in the repository should it?
    internal var statistics: Statistics!
    
    internal var statisticsRepo = StatisticsRepository()

    //feature envy where we ask another object to get info to perform computation or make a decision
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEditButtonItemToRightOfNavBar()
    }
    
    private  func addEditButtonItemToRightOfNavBar() {
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        statistics.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statistics.sections[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        statistics.sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == statistics.lastSectionIndex {
            let rows = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if rows - 1 == indexPath.row {
                return .insert
            }
        }
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

extension BaseActivityStatisticsController {
    
    func retrieveSavedStatistics(key: StatisticsType) {
        do {
            try self.statistics = statisticsRepo.getStatistics(key)
        } catch {
            displayStatisticsRetrievalFailedErrorMessage()
        }
    }
    
    func displayStatisticsRetrievalFailedErrorMessage() {
        let controller = UIAlertController(title: "Oops!, Statistics Retrieval Failed", message: "Using placeholder data.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        
        present(controller, animated: true)
    }
    
    func saveCurrentStatistics() {
        do {
            try statisticsRepo.save(statistics: self.statistics)
        } catch {
            displayStatisticsSaveFailedErrorMessage()
        }
    }
    
    func displayStatisticsSaveFailedErrorMessage() {
        let controller = UIAlertController(title: "Oops!, Failed to Save Statistics", message: "Please try again.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        
        present(controller, animated: true)
    }
}

extension BaseActivityStatisticsController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return false
    }

    internal func getCellTextFieldBelongsTo<T: UITableViewCell>(_ textField: UITextField) -> T {
        var v : UIView = textField
        
        repeat {
            v = v.superview!
        } while !(v is UITableViewCell)
        
        return v as! T
    }
}
