//
//  TableViewDataTests.swift
//  Stew's StatsTests
//
//  Created by Daniel Dutton on 24/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import XCTest
@testable import Stew_s_Stats

class TableViewDataTests: XCTestCase {
    
    func test_sectionHeaderValuesAreCorrect() {
        let sut = TableViewData()
        
        let expected = ["Zong"]
        let actual = sut.sectionHeaders
        
        XCTAssertEqual(expected, actual)
    }
}
