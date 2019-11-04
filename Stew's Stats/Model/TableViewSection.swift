import Foundation

struct TableViewSection: Codable  {
    var name: String
    var rows: [TableViewRow] = []
}
