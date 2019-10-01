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
        let section_2014 = Section(sectionName: "2014", values: [
            Row(statName: "50 Activities", statValue: "900 Miles"),
        ])
        let section_2015 = Section(sectionName: "2015", values: [
            Row(statName: "100 Activities", statValue: "1800 Miles"),
        ])
        let section_2016 = Section(sectionName: "2016", values: [
            Row(statName: "150 Activities", statValue: "2700 Miles"),
        ])
        let section_2017 = Section(sectionName: "2017", values: [
            Row(statName: "200 Activities", statValue: "3600 Miles"),
        ])
        let section_2018 = Section(sectionName: "2018", values: [
            Row(statName: "250 Activities", statValue: "4500 Miles"),
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
