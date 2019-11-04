import Foundation

class AnnualActivityStatisticsSeedData: ActivitySeedData {
    func getSeedData() -> [TableViewSection] {
        let section_2014 = TableViewSection(name: "2014", rows: [
            TableViewRow(stat1: "50", stat2: "900"),
        ])
        let section_2015 = TableViewSection(name: "2015", rows: [
            TableViewRow(stat1: "100", stat2: "1800"),
        ])
        let section_2016 = TableViewSection(name: "2016", rows: [
            TableViewRow(stat1: "150", stat2: "2700"),
        ])
        let section_2017 = TableViewSection(name: "2017", rows: [
            TableViewRow(stat1: "200", stat2: "3600"),
        ])
        let section_2018 = TableViewSection(name: "2018", rows: [
            TableViewRow(stat1: "250", stat2: "4500"),
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
