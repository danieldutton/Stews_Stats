import UIKit

class DailyActivityStatisticsCell: UITableViewCell {

    @IBOutlet weak var lblStat: UILabel!
    
    @IBOutlet weak var txtFieldStatValue: UITextField!

    override func didTransition(to state: UITableViewCell.StateMask) {
        self.txtFieldStatValue.isEnabled = state.contains(.showingEditControl)
        self.txtFieldStatValue.layer.zPosition = 10
        
        super.didTransition(to: state)
    }
}
