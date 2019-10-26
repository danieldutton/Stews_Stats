import UIKit

class AnnualActivityStatisticsCell: UITableViewCell {
    
    @IBOutlet weak var txtFieldAnnualActivities: UITextField!
    
    @IBOutlet weak var txtFieldAnnualMiles: UITextField!
    
    var asRow: Row {
        get {
            Row(stat1: txtFieldAnnualActivities.text!, stat2: txtFieldAnnualMiles.text!)
        }
        set(row) {
            txtFieldAnnualActivities.text = row.stat1
            txtFieldAnnualMiles.text = row.stat1
        }
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        self.txtFieldAnnualActivities.isEnabled = state.contains(.showingEditControl)
        self.txtFieldAnnualMiles.isEnabled = state.contains(.showingEditControl)
        
        super.didTransition(to: state)
    }

}
