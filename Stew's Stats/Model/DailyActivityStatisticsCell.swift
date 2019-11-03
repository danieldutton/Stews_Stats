import UIKit

class DailyActivityStatisticsCell: UITableViewCell {

    @IBOutlet weak var lblStat: UILabel!
    
    @IBOutlet weak var txtFieldStatValue: UITextField!
    
    var asRow: TableRow {
        get {
            TableRow(stat1: lblStat.text!, stat2: txtFieldStatValue.text!)
        }
        set(row) {
            lblStat.text = row.stat1
            txtFieldStatValue.text = row.stat1
        }
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        self.txtFieldStatValue.isEnabled = state.contains(.showingEditControl)
        self.txtFieldStatValue.layer.zPosition = 10
        
        super.didTransition(to: state)
    }
}
