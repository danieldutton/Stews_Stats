import UIKit

class BaseActivityStatisticsController: UITableViewController {
    
    internal var sections: [Section] = []
    
    internal var persistance = StatisticsCacher()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEditButtonItemToRightOfNavBar()
    }
    
    private  func addEditButtonItemToRightOfNavBar() {
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == sections.count - 1 {
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
    
    func indexPathIsValidFor(cell: UITableViewCell) -> IndexPath? {
        if let sec = self.tableView.indexPath(for: cell)?.section,
        let row = self.tableView.indexPath(for:cell)?.row {
            return IndexPath(row: row, section: sec)
        }
        return nil
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
