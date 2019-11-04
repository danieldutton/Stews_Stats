import Foundation
import UIKit

extension UITableView {
    func hasValidIndexPathFor(cell: UITableViewCell) -> IndexPath? {
        if let sec = self.indexPath(for: cell)?.section,
        let row = self.indexPath(for:cell)?.row {
            return IndexPath(row: row, section: sec)
        }
        return nil
    }
}
