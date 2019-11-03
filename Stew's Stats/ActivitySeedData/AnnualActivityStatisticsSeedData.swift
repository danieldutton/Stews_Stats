import Foundation

class AnnualActivityStatisticsSeedData: ActivitySeedData {
    func getSeedData() -> [TableSection] {
        let section_2014 = TableSection(name: "2014", rows: [
            TableRow(stat1: "50", stat2: "900"),
        ])
        let section_2015 = TableSection(name: "2015", rows: [
            TableRow(stat1: "100", stat2: "1800"),
        ])
        let section_2016 = TableSection(name: "2016", rows: [
            TableRow(stat1: "150", stat2: "2700"),
        ])
        let section_2017 = TableSection(name: "2017", rows: [
            TableRow(stat1: "200", stat2: "3600"),
        ])
        let section_2018 = TableSection(name: "2018", rows: [
            TableRow(stat1: "250", stat2: "4500"),
        ])
        
        return [
            section_2014,
            section_2015,
            section_2016,
            section_2017,
            section_2018,
        ]
    }
}
