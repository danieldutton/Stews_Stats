import Foundation

struct Statistics: Codable {
    var saveKey: StatisticsType? = nil
    var sections: [TableSection]
    
    var lastSectionIndex: Int {
        sections.count - 1
    }
    
    subscript(indexPath: IndexPath) -> TableRow? {
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

extension Statistics: Equatable {
    
    private func sectionAndRowExistsFor(indexPath: IndexPath) -> Bool {
        return sectionExistsFor(indexPath: indexPath) && rowExistsFor(indexPath: indexPath)
    }
    
    private func sectionExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.section >= 0 && indexPath.section < sections.count
    }
    
    private func rowExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.row >= 0 && indexPath.row < sections[indexPath.section].rows.count
    }
    
    mutating func removeRow(at indexPath: IndexPath) {
        sections[indexPath.section].rows.remove(at: indexPath.row)
    }
    
    static func == (lhs: Statistics, rhs: Statistics) -> Bool {
        return lhs.saveKey == rhs.saveKey &&
            lhs.sections == rhs.sections
    }
}

struct TableRow: Codable, Equatable {
    var stat1: String
    var stat2: String
}

struct TableSection: Codable, Equatable  {
    var name: String
    var rows: [TableRow] = []
}






