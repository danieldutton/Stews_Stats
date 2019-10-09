//
//  StewsAnnualData.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 01/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class StewsAnnualData: SeedData {
    func getSeedData() -> [Section] {
        let section_2014 = Section(name: "2014", rows: [
            Row(stat1: "50", stat2: "900"),
        ])
        let section_2015 = Section(name: "2015", rows: [
            Row(stat1: "100", stat2: "1800"),
        ])
        let section_2016 = Section(name: "2016", rows: [
            Row(stat1: "150", stat2: "2700"),
        ])
        let section_2017 = Section(name: "2017", rows: [
            Row(stat1: "200", stat2: "3600"),
        ])
        let section_2018 = Section(name: "2018", rows: [
            Row(stat1: "250", stat2: "4500"),
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
