//
//  SectionTool.swift
//  Stew's Stats Widget
//
//  Created by Daniel Dutton on 07/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class SectionTool {

    let sections: [Section]!
    
    init(){
        sections = Persistance.shared.retrievePersistedData(.annualSummary)!
    }
    
    func getRandomSection() -> Section {
        //get the test data
        //use prefs eventually
        let data: [Section] = AnnualActivityStatisticsSeedData().getSeedData()
        
        //get 1 random section index
        let random1 = Int(arc4random_uniform(UInt32(sections.count - 1)))
        
        //pull the section by random index
        let section1 = sections[random1]
        
        return section1
    }
    
    func getTwoSectionsDescByYear() -> SectionPair {
        var sections: Set<Section> = []
        
        repeat {
            sections.insert(getRandomSection())
        } while sections.count < 2
        
        let arr = Array(sections).sorted(by: >)
        
        return SectionPair(one: arr[0], two: arr[1])
    }
}
