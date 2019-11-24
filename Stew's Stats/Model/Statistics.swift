import Foundation
 
struct Statistics: Codable {
    var saveKey: StatisticsType? = nil
    var sections: [TableViewSection]
    
    var lastSectionIndex: Int {
        sections.count - 1
    }
    
    subscript(indexPath: IndexPath) -> TableViewRow? {
        get {
            guard sectionAndRowExistsFor(indexPath: indexPath) else {
                return nil
            }
            return sections[indexPath.section].rows[indexPath.row]
        }
        set {
            guard let row = newValue, sectionAndRowExistsFor(indexPath: indexPath) else {
                return
            }
            sections[indexPath.section].rows[indexPath.row] = row
        }
    }
}

extension Statistics {
    
    private func sectionAndRowExistsFor(indexPath: IndexPath) -> Bool {
        return sectionExistsFor(indexPath: indexPath) && rowExistsFor(indexPath: indexPath)
    }
    
    private func sectionExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.section >= 0 && indexPath.section < sections.count
    }
    
    //we are testing row here why?
    private func rowExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.row >= 0 && indexPath.row < sections[indexPath.section].rows.count
    }
    
    mutating func removeRow(at indexPath: IndexPath) {
        sections[indexPath.section].rows.remove(at: indexPath.row)
    }
}











