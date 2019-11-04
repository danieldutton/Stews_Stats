import UIKit

class TableViewCellDailyStat: UITableViewCell {

    @IBOutlet weak var lblStat: UILabel!
    
    @IBOutlet weak var txtFieldStatValue: UITextField!

    var asRow: TableViewRow {
        TableViewRow(
            stat1: lblStat.text!,
            stat2: txtFieldStatValue.text!
        )
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        enableTextField(to: state)
        sitUILabelViewBehindTextField()
        
        super.didTransition(to: state)
    }
    
    private func enableTextField(to state: UITableViewCell.StateMask) {
        self.txtFieldStatValue.isEnabled = state.contains(.showingEditControl)
    }
    
    private func sitUILabelViewBehindTextField() {
        self.txtFieldStatValue.layer.zPosition = 10
    }
}
