struct Statistics: Codable, Equatable {
    var saveKey: UserPrefsKey? = nil
    var sections: [Section]
    
    private enum CodingKeys: String, CodingKey {
        case sections
    }
}

struct Row: Codable, Equatable {
    var stat1: String
    var stat2: String
}

struct Section: Codable, Equatable {
    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.name == rhs.name && lhs.rows == rhs.rows
    }
    
    var name: String
    var rows: [Row] = []
}



