import Foundation

struct Statistics: Codable {
    var saveKey: StatisticsReport? = nil
    var sections: [Section]
    
    var lastSectionIndex: Int {
        sections.count - 1
    }
    
    subscript(indexPath: IndexPath) -> Row? {
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
    
    private func sectionAndRowExistsFor(indexPath: IndexPath) -> Bool {
        return sectionExistsFor(indexPath: indexPath) && rowExistsFor(indexPath: indexPath)
    }
    
    private func sectionExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.section >= 0 && indexPath.section < sections.count
    }
    
    private func rowExistsFor(indexPath: IndexPath) -> Bool {
        indexPath.row >= 0 && indexPath.row < sections[indexPath.section].rows.count
    }
}

struct Row: Codable, Equatable {
    var stat1: String
    var stat2: String
}

struct Section: Codable, Equatable  {
    var name: String
    var rows: [Row] = []
}

extension Statistics: Equatable {
    static func == (lhs: Statistics, rhs: Statistics) -> Bool {
        return lhs.saveKey == rhs.saveKey &&
            lhs.sections == rhs.sections
    }
}





