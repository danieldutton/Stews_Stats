import UIKit

class TableViewCellAnnualStat: UITableViewCell {
    
    @IBOutlet weak var txtFieldAnnualActivities: UITextField!
    
    @IBOutlet weak var txtFieldAnnualMiles: UITextField!
    
    var asRow: TableViewRow {
        TableViewRow(
            stat1: txtFieldAnnualActivities.text!,
            stat2: txtFieldAnnualMiles.text!
        )
    }

    override func didTransition(to state: UITableViewCell.StateMask) {
        enableBothTextFields(to: state)
        super.didTransition(to: state)
    }
    
    private func enableBothTextFields(to state: UITableViewCell.StateMask) {
        txtFieldAnnualActivities.isEnabled = state.contains(.showingEditControl)
        txtFieldAnnualMiles.isEnabled = state.contains(.showingEditControl)
    }
}
