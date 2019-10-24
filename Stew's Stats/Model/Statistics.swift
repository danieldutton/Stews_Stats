import Foundation

struct Statistics: Codable {
    var saveKey: StatisticsReport? = nil
    var sections: [Section]
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





